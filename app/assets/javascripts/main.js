$(document).ready(function(){
	$('.promo-slider').slides({
				preload: true,
				preloadImage: 'images/slider-loading.gif',
				play: 5000,
				pause: 2500,
				hoverPause: true,
				generateNextPrev: 1,
				effect : 'slide'
			});
			
	$('.login-block input.i-ch').ezMark(); 
	
	$('input,textarea').example(function() {
		return $(this).attr('title');
	});
})