const { defineConfig } = require('cypress')

module.exports = defineConfig({
  trashAssetsBeforeRuns: true,
  video: false,
  projectId: 'hrdqmx',
  defaultCommandTimeout: 30000,
  responseTimeout: 30000,
  requestTimeout: 30000,
  chromeWebSecurity: true,
  retries: 0,
  nonGlobalStepDefinitions: false,
  step_definitions: 'cypress/support/step_definitions/',
  viewportWidth: 1400,
  viewportHeight: 1000,
  e2e: {
    // We've imported your old cypress plugins here.
    // You may want to clean this up later by importing these.
    setupNodeEvents(on, config) {
      require('./cypress/plugins/index.js')(on, config);
      return config;
    },
    baseUrl: 'http://localhost:8080',
    specPattern: 'cypress/features/**/*.{feature,features,js}',
    experimentalSessionAndOrigin: false,
    testIsolation: "legacy"
  },
})