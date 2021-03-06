---
to: config/default.js
---

module.exports = {
  server: {
    host: '0.0.0.0',
    port: 4000,
  },
  auth: {
    secret: process.env.JWT_SECRET || 'secreto',
    options: {
      expiresIn: process.env.JWT_SECRET_EXPIRATION || '4h',
    },
  },
  routes: {
    init: {
      maxPayloadSize: '1mb',
      generatedDocs: [
        {
          path: '/docs/bus',
          srcFolder: 'asyncapi',
        },
        {
          path: '/docs/jsdoc',
          srcFolder: 'jsdoc',
        },
      ],
      swaggerOptions: {
        info: {
          description: 'Documentation for <%= h.inflection.titleize(npm_package_name) %>',
          title: '<%= h.inflection.dasherize(npm_package_name) %>',
          version: '1.0.0',
          contact: {
            name: 'Contact name',
            email: 'contact email',
          },
        },
        servers: [],
        security: {
          JWT: {
            type: 'apiKey',
            in: 'header',
            name: 'Authorization',
          },
        },
        baseDir: process.cwd(),
        swaggerUIPath: '/docs/api',
        filesPattern: './**/**-routes.js',
      },
    },
  },
  metrics: {
    key: process.env.APPINSIGHTS_INSTRUMENTATIONKEY,
    internalLogging: false,
    context: {
      tags: {
        'ai.cloud.role': process.env.npm_package_name,
        'ai.cloud.roleInstance': process.env.HOSTNAME || 'local',
      },
    },
    autoCollect: {
      requests: true,
      performance: true,
      exceptions: true,
      dependencies: true,
      console: false,
    },
  },
  logger: {
    transport: 'console',
    include: [
      'tracer',
      'timestamp',
      'level',
      'message',
      'error.message',
      'error.code',
      'error.stack',
      'request.url',
      'request.headers',
      'request.params',
      'request.method',
      'response.statusCode',
      'response.headers',
      'response.time',
      'process',
      'system',
      'package.name',
      'service',
    ],
    exclude: ['password', 'secret', 'token', 'request.headers.cookie', 'dependencies', 'devDependencies'],
  },
};
