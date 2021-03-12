---
to: app/components/app/index.js
---
const System = require('systemic');
const optional = require('optional');
const { join } = require('path');

const manifest = optional(join(process.cwd(), 'manifest.json')) || {};
const pkg = require(join(process.cwd(), 'package.json')); // eslint-disable-line import/no-dynamic-require

module.exports = new System({ name: '<%= h.inflection.dasherize(npm_package_name) %>' }).add('manifest', manifest).add('pkg', pkg);
