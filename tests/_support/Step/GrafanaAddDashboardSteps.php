<?php

namespace Step;

use Page\GrafanaHomeDashboardPage;
use Page\GrafanaManageDashboardPage;

class GrafanaAddDashboardSteps extends \AcceptanceTester
{
	/**
	 * Function to Copy a Dashboard and Save it
	 *
	 * @param string $dashboardName
	 * @throws \Exception
	 */
	public function copyDashboard($dashboardName = 'Copy Dashboard')
	{
		$I = $this;
		$I->amOnPage(GrafanaHomeDashboardPage::$url);
		$I->waitForText(GrafanaHomeDashboardPage::$dashboardHeaderText, 30, GrafanaHomeDashboardPage::$dashboardHeaderTextLocator);
		$I->click(GrafanaHomeDashboardPage::$dashboardManageButton);
		$I->waitForElement(GrafanaManageDashboardPage::$saveAsButton, 60);
		$I->click(GrafanaManageDashboardPage::$saveAsButton);
		$I->waitForElementVisible(GrafanaManageDashboardPage::$modalPopUp, 60);
		$I->fillField(GrafanaManageDashboardPage::$dashboardName, $dashboardName);
		$I->click(GrafanaManageDashboardPage::$saveButton);
		$I->waitForText(GrafanaHomeDashboardPage::$dashboardHeaderText, 60);
		$I->see('Dashboard saved', '.alert-success');
	}
}