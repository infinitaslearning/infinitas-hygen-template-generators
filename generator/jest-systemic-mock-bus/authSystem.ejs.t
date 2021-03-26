---
to: app/test/mocks/authSystem.js
---
const debug = require('debug')('mocks:auth');

const { tagError, errorFactory, CustomErrorTypes } = require('error-handler-module');
const { authenticatePayloads } = require('../fixtures/api/api.json');

module.exports = role => {
  const start = () => {
    const authenticate = (req, res, next) => {
      debug('authenticate');
      res.locals.payload = authenticatePayloads[role];
      next();
    };

    const authorise = attribute => allowedList => (req, res, next) => {
      debug('authorise');
      const { payload } = res.locals;
      if (allowedList.includes(payload[attribute])) return next();
      return next(tagError(errorFactory(CustomErrorTypes.FORBIDDEN)(
        `Role ${payload.role} not allowed to perform this operation`,
      )));
    };

    return Promise.resolve({
      authenticate,
      authorise,
    });
  };

  return { start };
};
