 'use strict';

module.exports = {
  graphPage: {
    openSearch: element(by.linkText('Cross Server Graphs')),
    searchFld: element(by.css('placeholder="Find dashboards by name"')),
    loadAvgChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "Load Average"]')),
    memUsgChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "Memory Usage"]')),
    mysqlConnChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Connections"]')),
    mysqlQueryChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Queries"]')),
    mysqlTrafChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Traffic"]')),
    netTrafChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "Network Traffic"]')),
    sysInfoChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "System Info"]')),
    mysqlInfoChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Info"]')),
    manageBtn:  element(by.css('i.fa.fa-cog')),
    saveAs: element(by.linkText("Save As...")),
    modalWindow: element(by.className('modal-body')), 
    saveBtn: $('.modal-body').element(by.linkText("Save")), 
    saveName: $('.modal-body').element(by.xpath("//div[@class='p-t-2']/div/input")), 
    
  },
    get: function(url) {
    browser.driver.get(url + '/graph/');
  },

    clickOpenSearch: function() {
      this.graphPage.openSearch.click();
    },

    searchDashboard: function(name) {
      this.graphPage.searchFld.sendKeys(name);
      browser.sleep(5000);
      element(by.xpath("//span[@class='search-result-link']//span[.='" + name + "']")).click();
    },

    savePageAs: function(newDashboard) {
      var page = this.graphPage;
      page.manageBtn.click().then(function() {
        page.saveAs.click().then(function() {
          page.saveName.clear().then(function() {
            page.saveName.sendKeys(newDashboard).then(function() {
              page.saveBtn.click();
             });
          });
        });
      });
   },
};
