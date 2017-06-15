var graphMainDash = require('../page_objects/graphMainDash.po.js')

describe('Prepare upgrade tests', function() {
  beforeEach(function () {
    var EC = protractor.ExpectedConditions;
    graphMainDash.get(browser.baseUrl);
    browser.ignoreSynchronization = true;
    console.log('Start before Each');
       browser.wait(function() {
      return browser.driver.getCurrentUrl().then(function(url) {
        return /cross-server-graphs/.test(url);
      });
    });
       console.log('Url is waited');
    var body =  element(by.css('i.fa.fa-cog')) ;
     browser.driver.wait(EC.visibilityOf(body), 100000).then(function () {
     });
  });

  afterEach(function () {
  });


  it('should create dashboard', function() {
    graphMainDash.savePageAs('New saved dashboard 1234');
    graphMainDash.openSearch();

  });

});
