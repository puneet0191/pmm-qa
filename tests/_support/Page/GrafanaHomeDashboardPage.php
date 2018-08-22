<?php
/**
 * Created by PhpStorm.
 * User: puneet
 * Date: 30/6/18
 * Time: 12:59 PM
 */

namespace Page;

class GrafanaHomeDashboardPage
{
	/**
	 * Page Url
	 *
	 */
	public static $url = '/graph/d/Fxvd1timk/home-dashboard?orgId=1';

	/**
	 * Monitored DB count
	 */
	public static $monitoredDbCount = "//span[@class='panel-title-text' and contains(text(), 'Monitored DB Instances')]//../../../..//span[@class='singlestat-panel-value']";

	/**
	 * Dashboard Header Text Locator
	 */
	public static $dashboardHeaderTextLocator = "//div[contains(@class, 'dashboard-header')]";

	/**
	 * Dashboard Header Text
	 */
	public static $dashboardHeaderText = "Percona Monitoring and Management";

	/**
	 * System Under Monitoring Locator
	 *
	 */
	public static $systemUnderMonitoringCount = "//span[@class='panel-title-text' and contains(text(), 'Systems under monitoring')]//../../../..//span[@class='singlestat-panel-value']";

	/**
	 * Locator for Setting Button
	 */
	public static $dashboardManageButton = "//button[@ng-click='ctrl.toggleSettings()']";

	/**
	 * Dashboard Title Locator
	 */
	public static $dashboardTitleLocator = "//dashnav";
}