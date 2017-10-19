<?php
/**
 * rich plugin for Craft CMS
 *
 * Rich_Myservice Service
 *
 * --snip--
 * All of your plugin’s business logic should go in services, including saving data, retrieving data, etc. They
 * provide APIs that your controllers, template variables, and other plugins can interact with.
 *
 * https://craftcms.com/docs/plugins/services
 * --snip--
 *
 * @author    rich
 * @copyright Copyright (c) 2017 rich
 * @link      rich@kerntiff.com
 * @package   Rich
 * @since     1.0.0
 */

namespace Craft;

class Rich_MyserviceService extends BaseApplicationComponent
{
    /**
     * This function can literally be anything you want, and you can have as many service functions as you want
     *
     * From any other plugin file, call it like this:
     *
     *     craft()->rich_myservice->exampleService()
     */
    public function hellofromphp()
    {
    $message = "Hello from PHP";
    echo "<script type='text/javascript'>alert('$message');</script>";
    }

}
