---
to: test/.eslintrc
---
{
  "env": {
    "jest": true
  },
  "plugins": ["jest"],
  "rules": {
    "jest/no-disabled-tests": "error",
    "jest/no-focused-tests": "error",
    "jest/no-identical-title": "error",
    "jest/prefer-to-have-length": "warn",
    "jest/valid-expect": "error"
  }
}
