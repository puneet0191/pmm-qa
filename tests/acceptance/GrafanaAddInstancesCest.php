<?php
/**
 * Created by PhpStorm.
 * User: puneet
 * Date: 1/7/18
 * Time: 3:25 PM
 */

use Step\GrafanaAddDashboardSteps;

class GrafanaAddInstancesCest
{
	public function __construct()
	{
		$this->faker = Faker\Factory::create();
		$this->dashboardName = $this->faker->bothify("Dashboard Name  ##??");
	}

	public function testDashboardCopy(GrafanaAddDashboardSteps $I)
	{
		$I->comment("Check if Dashboard is being Copied Successfully or not");
		$I->copyDashboard($this->dashboardName);
	}
}