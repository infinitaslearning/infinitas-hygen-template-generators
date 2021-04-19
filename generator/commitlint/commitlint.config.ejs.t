---
to: app/commitlint.config.js
sh: npm --prefix ./app install --save-dev @commitlint/config-conventional @commitlint/cli
---
module.exports = { extends: ['@commitlint/config-conventional'] };