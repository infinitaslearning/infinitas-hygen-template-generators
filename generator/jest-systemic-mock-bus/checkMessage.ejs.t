---
to: test/mocks/checkMessage.js
---
const { spy } = require('sinon');
const debug = require('debug')('mocks:bus');

const logger = (topic, data) => debug(`Publish on ${topic} with data ${data}`);

const api = { logger };

module.exports = spy(api, 'logger');
