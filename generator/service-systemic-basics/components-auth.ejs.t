---
to: components/auth/index.js
---
const Systemic = require('systemic');
const initAuth = require('@he-learning/module-he-auth');

module.exports = new Systemic({ name: 'auth' })
  .add('auth', initAuth()).dependsOn('config');
