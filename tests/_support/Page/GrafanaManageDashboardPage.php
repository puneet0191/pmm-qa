<?php

namespace Page;

class GrafanaManageDashboardPage
{
	/**
	 * Save Button Locator
	 */
	public static $saveAsButton = "//button[@ng-click='ctrl.openSaveAsModal()']";

	/**
	 * New Dashboard Name Modal Window Locator
	 */
	public static $modalPopUp = "//div[@class='modal-body']";

	/**
	 * Name of the Dashboard, Input Field Locator
	 */
	public static $dashboardName = "//div[@class='modal-body']//label[text()='New name']//..//input";

	/**
	 * Save Button
	 */
	public static $saveButton = "//div[@class='modal-body']//button[@class='btn btn-success']";
}