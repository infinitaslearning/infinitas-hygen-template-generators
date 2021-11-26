---
to: package.json
sh: npm install
---
{
  "name": "<%= h.inflection.dasherize(npm_package_name) %>",
  "version": "0.0.1",
  "description": "<%= npm_package_description %>",
  "main": "index.js",
  "scripts": {
    "local": "SERVICE_ENV=local node index.js",
    "start": "node index.js",
    "test:report": "cross-env NODE_ENV=test jest --detectOpenHandles --forceExit --coverage",
    "test": "cross-env NODE_ENV=test jest --detectOpenHandles --forceExit --reporters=default",
    "create-asyncapi-docs": "node_modules/@asyncapi/generator/cli.js docs/src/asyncapi/asyncapi.yml @asyncapi/html-template -o docs/generated/asyncapi",
    "create-jsdoc-docs": "node_modules/jsdoc/jsdoc.js . -r -c docs/src/jsdoc/jsdoc-config.json -d docs/generated/jsdoc",
    "lint": "eslint .",
    "license:checker": "npx @guidesmiths/license-checker --outputFileName licence-report --failOn AGPL,GPL",
    "docker:compose:up": "docker-compose --file docker-compose.yml pull && docker-compose --file docker-compose.yml up -d --force-recreate",
    "docker:compose:up:force": "docker stop service-he-hst-results-api_db_1 && docker rm service-he-hst-results-api_db_1 && npm run docker:compose:up && npm t",
    "postinstall": "npm run license:checker",
    "manifest": "node_modules/make-manifest/bin/make-manifest"
  },
  "devDependencies": {
    "@commitlint/cli": "^11.0.0",
    "@commitlint/config-conventional": "^11.0.0",
    "@guidesmiths/license-checker": "^1.0.5",
    "chai": "^4.2.0",
    "eslint": "^7.19.0",
    "eslint-config-airbnb-base": "^14.2.1",
    "eslint-plugin-import": "^2.22.1",
    "eslint-plugin-jest": "^24.1.3",
    "husky": "^4.3.8",
    "jest": "^26.6.3",
    "jest-config": "^26.6.3",
    "jest-junit": "^12.0.0",
    "jsdoc": "^3.6.6",
    "make-manifest": "^1.0.4",
    "sinon": "^11.1.2",
    "supertest": "^6.1.3"
  },
  "dependencies": {
    "@he-learning/module-he-auth": "^1.0.141294",
    "@he-learning/service-he-common": "^1.0.113185",
    "@infinitas/azure-bus-validator": "^1.0.26111",
    "@infinitas/dynamic-debug": "^1.0.109966",
    "helmet": "^4.4.1",
    "express-oas-validator": "^2.0.0",
    "error-handler-module": "^1.0.6",
    "dotenv": "^10.0.0",
    "http-status-codes": "^2.1.4",
    "on-headers": "^1.0.2",
    "body-parser": "^1.19.0",
    "boom": "^7.3.0",
    "bunyan": "^1.8.15",
    "chalk": "^4.1.0",
    "confabulous": "^1.7.0",
    "cross-env": "^7.0.3",
    "debug": "^4.3.1",
    "express": "^4.17.1",
    "express-jsdoc-swagger": "^1.3.1",
    "hogan.js": "^3.0.2",
    "optimist": "^0.6.1",
    "optional": "^0.1.4",
    "prepper": "^1.2.0",
    "ramda": "^0.27.1",
    "require-all": "^3.0.0",
    "systemic": "^3.3.9",
    "systemic-express": "^1.1.1",
    "systemic-domain-runner": "^1.1.0",
    "systemic-azure-metrics": "^0.2.0"
  },
  "husky": {
    "hooks": {
      "commit-msg": "commitlint -E HUSKY_GIT_PARAMS",
      "pre-commit": "npm run lint",
      "pre-push": "npm run test"
    }
  }
}
