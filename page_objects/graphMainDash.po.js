 'use strict';

module.exports = {
  graphPage: {
    //openSearch: element(by.linkText('Cross Server Graphs')),
    //openSearch: element(by.css('[ng-click="openSearch()"]')),
    openSearch: element(by.css('[ng-click="ctrl.showSearch()"]')),
    openSearchTxt: element(by.xpath('//*[@ng-click="ctrl.showSearch()"]/i')),
    listDashboards: element.all(by.repeater('row in ctrl.results')),
    loadAvgChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "Load Average"]')),
    memUsgChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "Memory Usage"]')),
    mysqlConnChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Connections"]')),
    mysqlQueryChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Queries"]')),
    mysqlTrafChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Traffic"]')),
    netTrafChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "Network Traffic"]')),
    sysInfoChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "System Info"]')),
    mysqlInfoChart: element(by.xpath('//span[contains(@class, "panel-title-text drag-handle") and (text()) = "MySQL Info"]')),
    searchFld: element(by.css('[placeholder="Find dashboards by name"]')),
    manageBtn:  element(by.css('i.fa.fa-cog')),
    saveAsMenu: element(by.partialLinkText("Save As")),
    modalWindow: element(by.className('modal-body')), 
    saveBtn: $('.modal-body').element(by.buttonText("Save")), 
    saveName: $('.modal-body').element(by.xpath("//div[@class='p-t-2']/div/input")), 
    deleteMenu: element(by.css('[ng-click="deleteDashboard()"]')), 
    deleteBtn: $('.modal-body').element(by.linkText("Delete")),

  },
    get: function(url) {
    browser.driver.get(url + '/graph/',60000);
    browser.sleep(5000);
  },

    clickOpenSearch: function() {
      this.graphPage.openSearch.click();
    },

    searchDashboard: function(name) {
     return this.graphPage.searchFld.sendKeys(name).then(function(){
       browser.sleep(5000);
       element(by.xpath("//span[@class='search-result-link']//span[.='" + name + "']")).click();
       browser.sleep(20000);
     });
    },

    saveDashboardAs: function(name) {
      var page = this.graphPage;
      page.manageBtn.click().then(function() {
        browser.sleep(100);
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
      this.graphPage.openSearch.click().then(function() {
        module.exports.searchDashboard(name).then(function() {
          page.manageBtn.click().then(function() {
            page.deleteMenu.click().then(function() {
              page.deletBtn.click();
            });
          });
        });
      })  
    },

    countDashboards: function() {
      return this.graphPage.listDashboards.count();
    },


};
