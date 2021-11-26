---
to: test/mocks/busSystem/bus.js
---
const validator = require('@infinitas/azure-bus-validator');
const debug = require('debug')('mocks:bus');
const logger = require('./logger');

const dummyPublish = () => topic => async data => {
  validator.validatePublishPayload(topic, data);
  logger(topic, data);
};

const dummySubscribe = () => () => () => debug('Subscribe');

module.exports = () => ({
  publish: dummyPublish(),
  subscribe: dummySubscribe(),
});
