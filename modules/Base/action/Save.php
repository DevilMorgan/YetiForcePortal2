<?php
/**
 * Save Action Class
 * @package YetiForce.Actions
 * @license licenses/License.html
 * @author Radosław Skrzypczak <r.skrzypczak@yetiforce.com>
 */
namespace YF\Modules\Base\Action;

use YF\Core;

class Save extends Base
{

	/**
	 * Process
	 * @param \YF\Core\Request $request
	 * @return mixed
	 */
	public function process(\YF\Core\Request $request)
	{
		$module = $request->getModule();
		$record = $request->get('record');
		$view = $request->get('view');
		$api = \YF\Core\Api::getInstance();
		$result = $api->call($module . '/Record/' . $record, $request->getAll(), $record ? 'put' : 'post');
		if ($request->isAjax()) {
			$response = new \YF\Core\Response();
			$response->setResult($result);
			$response->emit();
		} else {
			header("Location:index.php?module=$module&view=$view&record=$record");
		}
	}
}
