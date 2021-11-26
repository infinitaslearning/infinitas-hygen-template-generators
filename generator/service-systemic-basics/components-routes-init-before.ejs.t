---
to: components/routes/init/before-routes.js
---
const path = require('path');
const helmet = require('helmet');
const express = require('express');
const expressJSDocSwagger = require('express-jsdoc-swagger');
const { init: initializeExpressValidator } = require('express-oas-validator');

/**
 *  This component initializes Express setup and adds some middleware which
 * must be set up before the definition of other routes.
 *
 *  It is important that it ALWAYS appear the first in the list of dependencies
 * found in the "index.js" file of the "routes" folder. Otherwise, you may
 * experience errors due to some configuration or middlewares that are not
 * properly initialized.
 */
module.exports = () => {
  const start = async ({ app, config }) => {
    const { generatedDocs, swaggerOptions, maxPayloadSize } = config;

    // Add middleware to parse request body
    app.use(express.urlencoded({ extended: true }));
    app.use(express.json({ limit: maxPayloadSize }));

    // Add settings to deploy Swagger docs
    app.use(helmet({ contentSecurityPolicy: false }));
    const expressJSDocSwaggerInstance = expressJSDocSwagger(app)(swaggerOptions);

    // Initialize express validator library when docs have been parsed to JSON
    expressJSDocSwaggerInstance.on('finish', data => {
      initializeExpressValidator(data);
    });

    // Add middleware to serve generated documentation
    generatedDocs.forEach(documentation => {
      app.use(
        documentation.path,
        express.static(
          path.resolve(process.cwd(), 'docs', 'generated', documentation.srcFolder),
        ),
      );
    });

    return Promise.resolve();
  };

  return { start };
};
