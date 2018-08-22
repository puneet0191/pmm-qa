<?php


class checkDatasourcesCest
{
    // tests
    public function checkDataSources(ApiTester $I)
    {
    	$I->wantTo("verify Data Sources has MYsql");
    	$I->haveHttpHeader('Accept', 'application/json');
    	$I->haveHttpHeader( 'Content-Type', 'application/json');
    	$I->haveHttpHeader('Authorization', 'Bearer eyJrIjoiNnE2Znd4eDdyMXZHN0g0S0hXa0tJU0FuRTBGV3dTN1oiLCJuIjoicHVuZWV0LWFwaSIsImlkIjoxfQ==');
    	$I->sendGET('/api/datasources');
    	codecept_debug($I->grabResponse());
    	$I->seeResponseIsJson();
    	$I->seeResponseContainsJson(array("type" => "mysql"));
    }
}
