---
to: lib/errorFactory.js
---
const { errorFactory, CustomErrorTypes } = require('error-handler-module');

module.exports = {
  badRequestError: errorFactory(CustomErrorTypes.BAD_REQUEST),
  forbiddenError: errorFactory(CustomErrorTypes.FORBIDDEN),
  wrongInputError: errorFactory(CustomErrorTypes.WRONG_INPUT),
  notFoundError: errorFactory(CustomErrorTypes.NOT_FOUND),
  unauthorizedError: errorFactory(CustomErrorTypes.UNAUTHORIZED),
};
