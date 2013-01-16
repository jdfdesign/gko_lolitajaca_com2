//= require jquery
//= require jquery_ujs
//= require gko/public/jquery.grid.responsive.js
//= require twitter/bootstrap/transition.js
//= require twitter/bootstrap/alert.js
//= require twitter/bootstrap/button.js
//= require twitter/bootstrap/carousel.js
//= require twitter/bootstrap/collapse.js
//= require twitter/bootstrap/dropdown.js
//= require twitter/bootstrap/modal.js

//= require flexslider/jquery.flexslider
//= require theme2/javascripts/jquery.throttledresize.js
//= require theme2/javascripts/modernize.js
//= require theme2/javascripts/util
//= require theme2/javascripts/site


var $window,$body,$header,$mainContainer;
var headerHeight, viewPortHeight, viewPortWidth, availableHeight, currentProfile;



$(document).ready(function() {
	$body = $("body"),
	$window = $(window);
	$header = $('header.navbar');
	$sideBar = $('#sidebar');
	$mainContainer = $('#main-container');
	Util.updateDimensions();
	Site.init();
});
