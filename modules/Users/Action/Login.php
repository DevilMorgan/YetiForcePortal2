<?php
/**
 * User action login class.
 *
 * @copyright YetiForce Sp. z o.o.
 * @license   YetiForce Public License 3.0 (licenses/LicenseEN.txt or yetiforce.com)
 * @author    Mariusz Krzaczkowski <m.krzaczkowski@yetiforce.com>
 */

namespace YF\Modules\Users\Action;

use App\Purifier;

class Login extends \App\Controller\Action
{
	/**
	 * {@inheritdoc}
	 */
	public function checkPermission()
	{
		return true;
	}

	/**
	 * {@inheritdoc}
	 */
	public function loginRequired(): bool
	{
		return false;
	}

	/**
	 * {@inheritdoc}
	 */
	public function process()
	{
		$email = $this->request->getByType('email', Purifier::TEXT);
		$password = $this->request->getRaw('password');
		$userInstance = \App\User::getUser();
		$userInstance->set('language', $this->request->getByType('language', Purifier::STANDARD));
		try {
			$userInstance->login($email, $password);
		} finally {
			header('Location: ' . \App\Config::$portalUrl);
		}
	}
}
