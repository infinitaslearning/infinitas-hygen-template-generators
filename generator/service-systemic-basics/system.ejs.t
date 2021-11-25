---
to: system.js
---

const Systemic = require('systemic');
const initMetrics = require('systemic-azure-metrics');
const { join } = require('path');

// Use dotenv to allow retrieving env variables from local .env file
require('dotenv').config();

module.exports = () => new Systemic({ name: 'service-he-hst-content-api' })
// metrics need initialising before systems related to connections start
  .add('metrics', initMetrics())
  .dependsOn('config')
  .bootstrap(join(__dirname, 'components'));
