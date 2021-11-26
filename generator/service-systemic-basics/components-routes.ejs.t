---
to: components/routes/index.js
---
const { join } = require('path');
const Systemic = require('systemic');

// const apiRoutes = require('require-all')(join(__dirname, 'api'));
const beforeRouteInit = require('./init/before-routes');
const afterRouteInit = require('./init/after-routes');
const serviceRoutes = require('./service-routes');

module.exports = new Systemic({ name: 'routes' })
  .add('routes.init', beforeRouteInit())
  .dependsOn('config', 'logger', 'app')
  .add('routes.postinit', afterRouteInit())
  .dependsOn('config', 'logger', 'app')
  .add('routes.service', serviceRoutes())
  .dependsOn('app', 'auth', 'logger', 'manifest')
  .add('routes')
  .dependsOn(
    'routes.init',
    'routes.service',
  );
