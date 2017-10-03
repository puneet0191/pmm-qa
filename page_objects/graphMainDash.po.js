 'use strict';

module.exports = {
  graphPage: {
    openSearch: element(by.css('[ng-click="openSearch()"]')),
    openSearchTxt: element(by.xpath('//*[@ng-click="openSearch()"]/span')),
    listDashboards: element.all(by.repeater('row in ctrl.results')),
    searchFld: element(by.css('[ng-model="ctrl.query.query"]')),
    loadAvgChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "Load Average"]')),
    memUsgChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "Memory Usage"]')),
    mysqlConnChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Connections"]')),
    mysqlQueryChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Queries"]')),
    mysqlTrafChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Traffic"]')),
    netTrafChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "Network Traffic"]')),
    sysInfoChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "System Info"]')),
    mysqlInfoChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Info"]')),
    manageBtn:  element(by.css('i.fa.fa-cog')),
    saveAsMenu: element(by.linkText("Save As...")),
    modalWindow: element(by.className('modal-body')), 
    saveBtn: $('.modal-body').element(by.linkText("Save")), 
    saveName: $('.modal-body').element(by.xpath("//div[@class='p-t-2']/div/input")), 
    deleteMenu: element(by.css('[ng-click="deleteDashboard()"]')), 
    deleteBtn: $('.modal-body').element(by.linkText("Delete")),
  },
    get: function(url) {
    browser.driver.get(url + '/graph/');
  },

    clickOpenSearch: function() {
      return this.graphPage.openSearch.click();
    },

    searchDashboard: function(name) {
      return this.graphPage.searchFld.sendKeys(name).then(function() {
        console.log("Found!")  
        element(by.xpath("//span[@class='search-result-link']//span[.='" + name + "']")).click();
      });
    },

    saveDashboardAs: function(name) {
      var page = this.graphPage;
      page.manageBtn.click().then(function() {
        page.saveAsMenu.click().then(function() {
          page.saveName.clear().then(function() {
            page.saveName.sendKeys(name).then(function() {
              page.saveBtn.click();
             });
          });
        });
      });
   },

    deleteDashboard: function(name) {
      var page = this.graphPage;
      this.clickOpenSearch().then(function() {
        module.exports.searchDashboard(name).then(function() {
      //    page.manageBtn.click().then(function() {
           // page.deleteMenu.click().then(function() {
           //   page.deletBtn.click();
           // });
       //   });
        });
      });
   },

    countDashboards: function() {
       return this.graphPage.listDashboards.count();
    }
};
