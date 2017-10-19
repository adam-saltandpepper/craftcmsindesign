<?php
/**
 * rich plugin for Craft CMS
 *
 * rich Variable
 *
 * --snip--
 * Craft allows plugins to provide their own template variables, accessible from the {{ craft }} global variable
 * (e.g. {{ craft.pluginName }}).
 *
 * https://craftcms.com/docs/plugins/variables
 * --snip--
 *
 * @author    rich
 * @copyright Copyright (c) 2017 rich
 * @link      rich@kerntiff.com
 * @package   Rich
 * @since     1.0.0
 */

namespace Craft;

class RichVariable
{
    /**
     * Whatever you want to output to a Twig template can go into a Variable method. You can have as many variable
     * functions as you want.  From any Twig template, call it like this:
     *
     *     {{ craft.rich.exampleVariable }}
     *
     * Or, if your variable requires input from Twig:
     *
     *     {{ craft.rich.exampleVariable(twigValue) }}
     */
    public function exampleVariable($optional = null)
    {
        return "And away we go to the Twig template...";
    }
}