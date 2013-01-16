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
//= require jquery.throttledresize.js
//= require modernize.js
//= require util
//= require site


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
