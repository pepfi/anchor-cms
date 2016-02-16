<?php

/**
 * Theme functions for companies
 */

function total_companies() {
	if( ! $companies = Registry::get('companies')) {
		$companies = company::get();

		$companies = new Items($companies);

		Registry::set('companies', $companies);
	}

	return $companies->length();
}

// loop companies
function companies() {
	if( ! total_companies()) return false;

	$items = Registry::get('companies');

	if($result = $items->valid()) {
		// register single company
		Registry::set('company', $items->current());

		// move to next
		$items->next();
	}

	// back to the start
	if(!$result) $items->rewind();

	return $result;
}

// single companies
function company_id() {
	return Registry::prop('company', 'id');
}

function company_title() {
	return Registry::prop('company', 'title');
}

function company_slug() {
	return Registry::prop('company', 'slug');
}

function company_description() {
	return Registry::prop('company', 'description');
}

function company_url() {
	return base_url('company/' . company_slug());
}

function company_count() {
	return Query::table(Base::table('posts'))
		->where('company', '=', company_id())
		->where('status', '=', 'published')->count();
}

function company_custom_field($key, $default = '') {
	$id = Registry::prop('company', 'id');

	if($extend = Extend::field('company', $key, $id)) {
		return Extend::value($extend, $default);
	}

	return $default;
}
