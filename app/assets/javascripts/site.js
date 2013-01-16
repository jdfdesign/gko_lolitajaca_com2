var Site = {
	animating : false,
	
	init: function() {
	
	//	Carousel.addTheme();
	//	Carousel.init();
	
		
		Site.attachEvents();
		Site.onResize();
	},
	
	onScroll:function(e) {
		var st = Math.min(viewPortWidth*0.25,$window.scrollTop()*0.25);//,
		//so = $("#spirit").offset().top;

		//$("#spirit").css({backgroundPosition: (-st+so*0.2)*1.5+"px 0"});
	},
	
	onResize: function(e) {
		Util.updateDimensions();
		//$('.section-cover').css('height', viewPortHeight - 500);
	},
	
	attachEvents: function() {
		if(Modernizr.touch == false){			
			$(window).on("throttledresize",
				function(e) {
					Site.onResize(e);
					Site.onScroll(e);
		        }).on("scroll",
				function(e) {
					// set a timeout to avoid that the function gets called on every scroll trigger
					if( Site.animating ) return false;
					Site.animating = true;
					setTimeout( function() {
						Site.onScroll(e);
						Site.animating = false;
					}, 10 );
				});
		}
		else {
			$(window).on("throttledresize",
				function(e) {
					Site.onResize(e);
		        });
		}

		$('#main-slider').flexslider({
			animation: "slide",
			touch: true,
			controlNav: false,
			after: function(){
				var sl = $("#small-slider").data('flexslider');
				sl.flexAnimate(sl.getTarget("next"));
			}
		});	
		
		$('#small-slider').flexslider({
			animation: "slide",
			touch: true,
			controlNav: false,
			slideshow: false
		});
		
		Site.bindGrid();
	},
	bindGrid: function() {
		$('.grid .title > a').attr('data-remote', true)	
			.on("ajax:beforeSend", function(evt, xhr, settings) {
				
				// Store de current profile for next/prev function
				var id = $(this).closest('li').attr('id');
				
				if(currentProfile == id) {
					$("#modal-page").modal('show');
					return false;
				}
				else {
					currentProfile = id;
				}
				
			}).on("ajax:success", function(evt, xhr, settings) {
				console.log("Site.success xhr " + eval(xhr))
				$("#modal-content").css('max-height', availableHeight).html(eval(xhr));
				try{
					FB.XFBML.parse(); 
				} catch (e){
					console.log("FB error");
				}
				try{
					gapi.plusone.go('content');
				} catch (e){
					console.log("gapi error");
				}
				
				$("#modal-page").modal('show');
			}).on('ajax:complete', function(evt, xhr, status) {
			}).on("ajax:error", function(evt, xhr, status, error) {
				var flash = $.parseJSON(xhr.getResponseHeader('X-Flash-Messages'));
				console.log("Site.error " + flash.error);
			});
    }
}
