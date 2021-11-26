---
to: components/express/index.js
---
const Systemic = require('systemic');
const { defaultMiddleware, app, server } = require('systemic-express');

module.exports = new Systemic({ name: 'express' })
  .add('app', app()).dependsOn('config', 'logger')
  .add('middleware.default', defaultMiddleware())
  .dependsOn('logger', 'app', 'routes')
  .add('server', server())
  .dependsOn('config', 'app', 'middleware.default');
