---
to: test/mocks/busSystem/index.js
---
const { spy } = require('sinon');

const bus = require('./bus');
const logger = require('./logger');

module.exports = () => {
  const start = (_, cb) => {
    cb(null, {
      publish: spy(bus(), 'publish'),
      subscribe: spy(bus(), 'subscribe'),
      messageLogger: logger,
    });
  };

  return { start };
};
