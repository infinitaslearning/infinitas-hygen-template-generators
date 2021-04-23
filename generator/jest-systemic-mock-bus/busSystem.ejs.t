---
to: test/mocks/busSystem.js
---
const { spy } = require('sinon');

const bus = require('./bus');

module.exports = () => {
  const start = (_, cb) => {
    cb(null, {
      publish: spy(bus(), 'publish'),
      subscribe: spy(bus(), 'subscribe'),
    });
  };

  return { start };
};
