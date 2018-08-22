<?php

use Step\GrafanaVerifyMonitoredInstancesSteps;

class CheckPmmAddInstanceCest
{
	public function checkPmmAddInstance(GrafanaVerifyMonitoredInstancesSteps $I)
	{
		$I->amOnPage("/graph/d/_jgkZkDmz/_pmm-add-instance?orgId=1");
		$frame_name = 'add-instance-frame';
		$I->wait(10);
		$I->executeJS("$('ng-transclude iframe').attr('name', '$frame_name')");
		$I->switchToIFrame($frame_name);
		$I->see("How to Add an Instance", "//h3");
		$I->click("//a[@href='/qan/add-aws']");
		$I->switchToIFrame();
	}
}