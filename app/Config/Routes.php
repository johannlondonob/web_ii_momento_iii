<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php')) {
	require SYSTEMPATH . 'Config/Routes.php';
}

/**
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

/**
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');
$routes->group('user', function ($routes) {
	$routes->get('/', 'User::index');
	$routes->post('/sign-in', 'User::signin');
	$routes->post('/sign-up', 'User::signup');
});

$routes->group('property', function ($routes) {
	$routes->get('/', 'Property::index');
	$routes->post('new/', 'Property::insert');
	$routes->post('edit/', 'Property::edit');
});

$routes->group('property-user', function ($routes) {
	$routes->get('/', 'PropertyUser::index');
	$routes->get('price/(:alpha)', 'PropertyUser::byPrice/$1');
	$routes->get('user/(:num)/(:alpha)', 'PropertyUser::byUser/$1/$2');
	$routes->post('new/', 'PropertyUser::insert');
	// $routes->post('edit/', 'PropertyUser::edit');
	$routes->post('delete/', 'PropertyUser::delete');
	$routes->post('restore/', 'PropertyUser::restore');
	$routes->post('delete-permanent/', 'PropertyUser::deletePermanent');
});

/**
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need to it be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
	require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
