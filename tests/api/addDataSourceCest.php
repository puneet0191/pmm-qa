<?php


class addDataSourceCest
{
    public function tryToTest(ApiTester $I)
    {
		$I->wantTo("verify Data Sources has MYsql");
		$I->haveHttpHeader('Accept', 'application/json');
		$I->haveHttpHeader( 'Content-Type', 'application/json');
		$I->haveHttpHeader('Authorization', 'Bearer eyJrIjoiNnE2Znd4eDdyMXZHN0g0S0hXa0tJU0FuRTBGV3dTN1oiLCJuIjoicHVuZWV0LWFwaSIsImlkIjoxfQ==');
		$json = '{
			  "name": "test_datasource",
			  "type": "cloudwatch",
			  "url": "http://monitoring.us-west-1.amazonaws.com",
			  "access": "proxy",
			  "jsonData": {
				"authType": "keys",
				"defaultRegion": "us-west-1"
			  },
			  "secureJsonData": {
				"accessKey": "Ol4pIDpeKSA6XikgOl4p", //should not be encoded
				"secretKey": "dGVzdCBrZXkgYmxlYXNlIGRvbid0IHN0ZWFs" //should be Base-64 encoded
			  }
			}';
		$content = [ 'name' => "test_datasource",
			'type' => "cloudwatch",
			'url' => "http://monitoring.us-west-1.amazonaws.com", 'access' => "proxy", "jsonData" => [ 'authType' => "keys", 'defaultRegion' => 'us-west-1'],
			'secureJsonData' => [ 'accessKey' => "Ol4pIDpeKSA6XikgOl4p", 'secretKey' => "dGVzdCBrZXkgYmxlYXNlIGRvbid0IHN0ZWFs"]];

		$result = json_decode ($json, true, 3);
		$I->sendPOST('/api/datasources', $content);
		codecept_debug($I->grabResponse());
		$I->seeResponseIsJson();
		$I->seeResponseContainsJson(array("message" => "Datasource added"));
    }
}
