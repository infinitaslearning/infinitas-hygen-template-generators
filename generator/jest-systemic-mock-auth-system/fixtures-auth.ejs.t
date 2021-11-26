---
to: test/fixtures/auth/index.js
---
const { ROLES } = require('@he-learning/service-he-common');

// Sample user tokens
const authToken = {
  EMPTY: '',
  ADMIN: 'admin',
  TEACHER: 'teacher',
  STUDENT: 'student',
  EXPIRED_STUDENT: 'studentWithExpiredLicense',
  TEST: 'test',
};

// Sample user payloads (the keys of this object must match one of the
// "authToken" values above)
const authPayload = {
  admin: {
    uuid: 1,
    role: ROLES.ADMIN,
  },
  teacher: {
    uuid: 2,
    role: ROLES.TEACHER,
  },
  student: {
    uuid: 3,
    role: ROLES.STUDENT,
  },
  studentWithExpiredLicense: {
    uuid: 4,
    role: ROLES.STUDENT,
  },
  test: {
    role: ROLES.TEST,
  },
};

module.exports = {
  authToken,
  authPayload,
};
