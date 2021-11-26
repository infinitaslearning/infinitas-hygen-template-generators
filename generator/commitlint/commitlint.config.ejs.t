---
to: commitlint.config.js
sh: npm install --save-dev @commitlint/config-conventional @commitlint/cli
---
module.exports = { extends: ['@commitlint/config-conventional'] };
