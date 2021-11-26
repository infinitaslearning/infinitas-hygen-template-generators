---
to: .eslintrc.json
---
{
	"extends": "airbnb-base",
	"parserOptions": {
		"sourceType": "module",
		"allowImportExportEverywhere": false,
		"ecmaVersion": 2021
	},
	"env": {
		"jest": true,
		"es6": true,
		"node": true
	},
	"plugins": ["jest"],
	"rules": {
		"indent": 2,
		"no-tabs": 0,
		"max-len": 0,
		"no-underscore-dangle": 0,
		"class-methods-use-this": ["off"],
		"no-nested-ternary": ["off"],
		"quotes": ["error", "single"],
		"linebreak-style": ["error", "unix"],
		"semi": ["error", "always"],
		"no-use-before-define": [
			"error",
			{
				"functions": false,
				"classes": false
			}
		],
		"arrow-parens": [
			"error",
			"as-needed",
			{
				"requireForBlockBody": false
			}
		]
	}
}
