var graphMainDash = require('../page_objects/graphMainDash.po.js')
var data = require('../test_data/grafana_data.json')
var random = require('../common/utils.js')

describe('Prepare upgrade tests', function() {
  beforeEach(function () {
    var EC = protractor.ExpectedConditions;
    graphMainDash.get(browser.baseUrl);
    browser.ignoreSynchronization = true;
       browser.wait(function() {
      return browser.driver.getCurrentUrl().then(function(url) {
        return /cross-server-graphs/.test(url);
      });
    });
    var body =  element.all(by.css('i.fa.fa-cog')).get(0) ;
     browser.driver.wait(EC.visibilityOf(body), 100000).then(function () {
     });
  });

  afterEach(function () {
  });


  it('should copy dashboard', function() {
    var n;
    var new_dashboard = data['new_dashboard'] + random.getRandomString(4);

 /*   graphMainDash.graphPage.openSearch.click().then(function() {
      graphMainDash.countDashboards().then(function(count) {
        n = count;
        return n;  
      });
    });
*/
    graphMainDash.saveDashboardAs(new_dashboard);
      graphMainDash.graphPage.openSearchTxt.getText().then(function(text) {
        expect(text).toEqual(new_dashboard);
    
    });
 });

  it('should delete dashboard', function() {
    var n;
    graphMainDash.graphPage.openSearch.click().then(function() {
      graphMainDash.countDashboards().then(function(count) {
        n = count;
        return n;  
      });
    });
  
    //graphMainDash.deleteDashboard(data['new_dashboard']);

  });
})
