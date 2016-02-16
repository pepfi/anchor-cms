<?php

/**
 * Theme functions for departments
 */

function total_departments() {
	if( ! $departments = Registry::get('departments')) {
		$departments = department::get();

		$departments = new Items($departments);

		Registry::set('departments', $departments);
	}

	return $departments->length();
}

// loop departments
function departments() {
	if( ! total_departments()) return false;

	$items = Registry::get('departments');

	if($result = $items->valid()) {
		// register single department
		Registry::set('department', $items->current());

		// move to next
		$items->next();
	}

	// back to the start
	if(!$result) $items->rewind();

	return $result;
}

// single departments
function department_id() {
	return Registry::prop('department', 'id');
}

function department_title() {
	return Registry::prop('department', 'title');
}

function department_slug() {
	return Registry::prop('department', 'slug');
}

function department_description() {
	return Registry::prop('department', 'description');
}

function department_url() {
	return base_url('department/' . department_slug());
}

function department_count() {
	return Query::table(Base::table('posts'))
		->where('department', '=', department_id())
		->where('status', '=', 'published')->count();
}

function department_custom_field($key, $default = '') {
	$id = Registry::prop('department', 'id');

	if($extend = Extend::field('department', $key, $id)) {
		return Extend::value($extend, $default);
	}

	return $default;
}
