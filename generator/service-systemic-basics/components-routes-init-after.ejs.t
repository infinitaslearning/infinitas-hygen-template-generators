---
to: components/routes/init/after-routes.js
---
const { handleHttpError } = require('error-handler-module');

/**
 *  This component adds some middleware which must be set up after all of the
 * application routes have been defined.
 *
 *  It is important that it ALWAYS appear the last in the list of dependencies
 * found in the "index.js" file of the "routes" folder.
 */
module.exports = () => {
  const start = async ({ app, logger }) => {
    // Add middleware for handling HTTP errors
    app.use(handleHttpError(logger));

    return Promise.resolve();
  };

  return { start };
};
