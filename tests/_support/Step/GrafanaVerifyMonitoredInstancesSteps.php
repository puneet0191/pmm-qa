<?php
/**
 * Created by PhpStorm.
 * User: puneet
 * Date: 30/6/18
 * Time: 12:59 PM
 */

namespace Step;

use Page\GrafanaHomeDashboardPage;

class GrafanaVerifyMonitoredInstancesSteps extends \AcceptanceTester
{
	/**
	 * Function to fetch Instances being Monitored
	 *
	 * @return string
	 */
	public function fetchMonitoredDbInstances()
	{
		$I = $this;
		$I->amOnPage(GrafanaHomeDashboardPage::$url);
		$I->waitForText(GrafanaHomeDashboardPage::$dashboardHeaderText, 30, GrafanaHomeDashboardPage::$dashboardHeaderTextLocator);
		return $I->grabTextFrom(GrafanaHomeDashboardPage::$monitoredDbCount);
	}

	/**
	 * Function to fetch Systems being Monitored
	 *
	 * @return mixed
	 * @throws \Exception
	 */
	public function fetchMonitoredSystemInstances()
	{
		$I = $this;
		$I->amOnPage(GrafanaHomeDashboardPage::$url);
		$I->waitForText(GrafanaHomeDashboardPage::$dashboardHeaderText, 30, GrafanaHomeDashboardPage::$dashboardHeaderTextLocator);
		return $I->grabTextFrom(GrafanaHomeDashboardPage::$systemUnderMonitoringCount);
	}
}