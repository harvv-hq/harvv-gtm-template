___INFO___

{
  "type": "TAG",
  "id": "harvv_pixel",
  "version": 1,
  "securityGroups": [],
  "displayName": "Harvv - Behavioral UX Analytics",
  "brand": {
    "id": "brand_harvv",
    "displayName": "Harvv",
    "thumbnail": "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjQwIiBoZWlnaHQ9IjQwIiByeD0iOCIgZmlsbD0iIzYzNjZmMSIvPjx0ZXh0IHg9IjIwIiB5PSIyNiIgZm9udC1mYW1pbHk9IkludGVyLHNhbnMtc2VyaWYiIGZvbnQtc2l6ZT0iMTYiIGZvbnQtd2VpZ2h0PSI4MDAiIGZpbGw9IiNmZmYiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkg8L3RleHQ+PC9zdmc+"
  },
  "description": "Install the Harvv behavioral analytics pixel. Detects dead clicks, rage clicks, hesitation, scroll problems, and JS errors automatically. AI-generated fix recommendations. Sets first-party cookies with a random visitor ID.",
  "containerContexts": [
    "WEB"
  ],
  "categories": [
    "ANALYTICS",
    "CONVERSIONS"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "pixelKey",
    "displayName": "Pixel Key",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Your Harvv pixel key. Find it in your Harvv dashboard under the site settings. It looks like: a1b2c3d4e5f6g7h8"
  },
  {
    "type": "TEXT",
    "name": "customEndpoint",
    "displayName": "Custom Endpoint (optional)",
    "simpleValueType": true,
    "help": "Only set this if you're self-hosting Harvv. Leave blank to use the default (harvv.com)."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const log = require('logToConsole');

const pixelKey = data.pixelKey;
const endpoint = data.customEndpoint || 'https://harvv.com';
const scriptUrl = endpoint + '/px/' + pixelKey + '/pixel.js';

log('Harvv: Loading pixel from ' + scriptUrl);

injectScript(scriptUrl, function() {
  log('Harvv: Pixel loaded successfully');
  data.gtmOnSuccess();
}, function() {
  log('Harvv: Failed to load pixel');
  data.gtmOnFailure();
}, 'harvvPixel');


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://harvv.com/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Pixel loads with valid key
  code: |-
    const mockData = {
      pixelKey: 'a1b2c3d4e5f6g7h8',
      customEndpoint: '',
      gtmOnSuccess: () => {},
      gtmOnFailure: () => {}
    };
    runCode(mockData);
    assertApi('injectScript').wasCalledWith(
      'https://harvv.com/px/a1b2c3d4e5f6g7h8/pixel.js',
      mockData.gtmOnSuccess,
      mockData.gtmOnFailure,
      'harvvPixel'
    );

- name: Custom endpoint works
  code: |-
    const mockData = {
      pixelKey: 'testkey123',
      customEndpoint: 'https://custom.domain.com',
      gtmOnSuccess: () => {},
      gtmOnFailure: () => {}
    };
    runCode(mockData);
    assertApi('injectScript').wasCalledWith(
      'https://custom.domain.com/px/testkey123/pixel.js',
      mockData.gtmOnSuccess,
      mockData.gtmOnFailure,
      'harvvPixel'
    );


___NOTES___

Harvv Behavioral UX Analytics Pixel

This tag loads the Harvv behavioral analytics pixel on your website.
The pixel is under 3.5KB gzipped and captures 18 behavioral signals
including dead clicks, rage clicks, hesitation, scroll depth, and
JS errors. It does not collect names, emails or typed text. It sets
first-party cookies with a random visitor ID, so list it in your privacy
policy and fire this tag only after consent where your visitors' law
requires it.

Setup:
1. Create a free account at harvv.com
2. Add your site and get your pixel key
3. Enter the pixel key in this tag configuration
4. Set trigger to "All Pages"

The pixel automatically detects UX issues and generates
AI-powered fix recommendations in your Harvv dashboard.

Learn more: https://harvv.com
