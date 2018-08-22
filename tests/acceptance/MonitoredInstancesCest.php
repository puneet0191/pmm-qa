<?php

use Step\GrafanaVerifyMonitoredInstancesSteps;

class MonitoredInstancesCest
{
	public function __construct()
	{
		$this->monitoredDbInstances = '1';
		$this->monitoredSystemInstances = '2';
	}

	/**
	 * Verify Db Instances Being Monitored
	 */
	public function testDbInstances(GrafanaVerifyMonitoredInstancesSteps $I)
	{
		$I->comment("Verifying the Number of DB Instances");
		codecept_debug($I->fetchMonitoredDbInstances());
		$I->assertEquals($this->monitoredDbInstances,$I->fetchMonitoredDbInstances(), "Both must be equal");
	}

	/**
	 * System Instances Verification Tests
	 * @param GrafanaVerifyMonitoredInstancesSteps $I
	 * @throws Exception
	 */
	public function testSystemInstances(GrafanaVerifyMonitoredInstancesSteps $I)
	{
		$I->comment("Verifying the Number of System Instances being Monitored");
		codecept_debug($I->fetchMonitoredSystemInstances());
		$I->assertEquals($this->monitoredSystemInstances, $I->fetchMonitoredSystemInstances(), "Both Must be Equal");
	}
}