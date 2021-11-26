---
to: test/mocks/authSystem/index.js
---
const debug = require('debug')('mocks:auth');

const { tagError } = require('error-handler-module');
const { unauthorizedError, forbiddenError } = require('../../../lib/errorFactory');

const { authPayload } = require('../../fixtures/auth');

module.exports = defaultToken => {
  const start = () => {
    const authenticate = (req, res, next) => {
      debug('authenticate');
      const token = req.headers.authorization;

      if (token === undefined && defaultToken) {
        debug(`use ${defaultToken} payload by default`);
        res.locals.payload = authPayload[defaultToken];
        return next();
      }

      if (!token || !authPayload[token]) {
        return next(tagError(
          unauthorizedError('User token does not exist or is not valid.'),
        ));
      }

      debug(`use ${token} payload`);
      res.locals.payload = authPayload[token];

      return next();
    };

    const authorise = attribute => allowedList => (req, res, next) => {
      debug('authorize');
      const { payload } = res.locals;
      if (allowedList.includes(payload[attribute])) return next();
      return next(tagError(
        forbiddenError(`Role ${payload.role} not allowed to perform this operation`),
      ));
    };

    return Promise.resolve({
      authenticate,
      authorise,
    });
  };

  return { start };
};
