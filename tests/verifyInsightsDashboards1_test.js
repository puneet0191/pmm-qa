
Feature("Test Dashboards inside the Insights Folder");

Scenario('Open the Advanced Data Exploration Dashboard', async (I, loginPage, adminPage, advancedDataExplorationPage) => {
    I.amOnPage(loginPage.url);
    loginPage.login("admin", "admin");

    I.amOnPage(advancedDataExplorationPage.url);
    I.waitForElement(adminPage.fields.metricTitle, 30);
    adminPage.applyTimer("1m");
    await adminPage.handleLazyLoading(10);
    advancedDataExplorationPage.verifyMetricsExistence();
});

Scenario('Open the Cross Server Graphs Dashboard', async (I, adminPage, crossServerGraphsPage) => {
    I.amOnPage(crossServerGraphsPage.url);
    I.waitForElement(adminPage.fields.metricTitle, 30);
    adminPage.applyTimer("1m");
    await adminPage.handleLazyLoading(10);
    crossServerGraphsPage.verifyMetricsExistence();
});

Scenario('Open the Prometheus Dashboard', async (I, adminPage, prometheusPage) => {
    I.amOnPage(prometheusPage.url);
    I.waitForElement(adminPage.fields.metricTitle, 30);
    adminPage.applyTimer("1m");
    for (let i in prometheusPage.panels) {
        adminPage.openPanel(prometheusPage.panels[i]);
    }
    await adminPage.handleLazyLoading(11);
    prometheusPage.verifyMetricsExistence();
});