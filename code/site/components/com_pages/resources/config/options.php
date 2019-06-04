<?php
/**
 * Joomlatools Pages
 *
 * @copyright   Copyright (C) 2018 Johan Janssens and Timble CVBA. (http://www.timble.net)
 * @license     GNU GPLv3 <http://www.gnu.org/licenses/gpl.html>
 * @link        https://github.com/joomlatools/joomlatools-pages for the canonical source repository
 */

return [

    'identifiers' => [
        'page.registry' => [
            'cache'       => $config['page_cache'] ?? (JDEBUG ? false : true),
            'cache_time'  => $config['page_cache_time'] ?? 60*60*24, //1d
            'cache_path'  => $config['page_cache_path'] ?? $base_path.'/cache',
            'collections' => $config['collections'] ?? array(),
        ],
        'com:pages.page.locator' => [
            'base_path' => $base_path
        ],
        'data.registry' => [
            'cache'      => $config['data_cache'] ?? (JDEBUG ? false : true),
            'cache_time' => $config['data_cache_time'] ?? 60*60*24, //1d
            'cache_path' => $config['data_cache_path'] ?? $base_path.'/cache',
        ],
        'com:pages.data.locator' => [
            'base_path' => $base_path.'/data'
         ],
        'template.engine.factory' => [
            'cache'      => $config['template_cache'] ?? (JDEBUG ? false : true),
            'cache_path' => $config['template_cache_path'] ?? JPATH_ADMINISTRATOR.'/cache/koowa.templates',
        ],
        'com://site/pages.dispatcher.behavior.cacheable' => [
            'cache'             => $config['http_cache'] ?? false,
            'cache_path'        => $config['http_cache_path'] ?? $base_path.'/cache',
            'cache_time'        => $config['http_cache_time']       ?? 60*15,  //15min
            'cache_time_shared' => $config['http_cache_time_proxy'] ?? 60*60*2, //2h
        ],
        'com://site/pages.dispatcher.router.resolver.redirect' => [
            'routes'  => isset($config['redirects']) ? array_flip($config['redirects']) : array(),
        ],
        'com://site/pages.data.client' => [
            'cache'      => $config['remote_cache'] ?? (JDEBUG ? false : true),
            'cache_time' => $config['remote_cache_time'] ?? 60*60*24, //1d
            'cache_path' => $config['remote_cache_path'] ??  $base_path.'/cache',
        ],
        'com://site/pages.model.entity.page' => [
            'data' => [
                'metadata' => $config['metadata'] ?? array(),
            ]
        ],
    ]
];