---
to: app/commitlint.config.js
sh: cd app && npm install --save-dev @commitlint/config-conventional @commitlint/cli
---
module.exports = { extends: ['@commitlint/config-conventional'] };