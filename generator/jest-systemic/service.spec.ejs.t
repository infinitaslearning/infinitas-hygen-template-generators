---
to: test/service.spec.js
---
// Modules
const { OK } = require('http-status');
const supertest = require('supertest');
// Libs
const system = require('../system');
// Mocks
const initBus = require('./mocks/busSystem');

describe('Service Tests', () => {
  let request;
  const sys = system();
  sys.set('bus', initBus()).dependsOn();

  beforeEach(async () => {
    const { app } = await sys.start();
    request = supertest(app);
  });

  afterEach(async () => {
    await sys.stop();
  });

  it('returns manifest', () => request
    .get('/__/manifest')
    .expect(OK)
    .then(response => {
      expect(response.headers['content-type']).toEqual('application/json; charset=utf-8');
    }));
});
