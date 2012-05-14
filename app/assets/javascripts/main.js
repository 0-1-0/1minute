$(document).ready(function(){
	var btnInterval = '';
	reInitScroll = function(){
		$('.popup .popup-slide:visible .scrollable').jScrollPane();
		var $btn = $('.popup .popup-slide:visible .btn-do i span');
		btnAnimate = function(){
			$btn.fadeIn(1000, function(){
				$btn.fadeOut(1000);
			})
		}
		clearInterval(btnInterval);
		btnInterval = setInterval(btnAnimate, 1000);
	}

	$('.promo-slider').slides({
				preload: false,
				play: 5000,
				pause: 2500,
				hoverPause: true,
				generateNextPrev: 1,
				effect : 'slide'
			});
			
	$('.popup-slider').slides({
				preload: false,
				play: 0,
				pause: 0,
				hoverPause: true,
				generateNextPrev: 1,
				effect : 'slide',
				animationComplete : function(){
					reInitScroll();
				}
			});		
			
	$('.login-block input.i-ch').ezMark(); 
	
	$('input,textarea').example(function() {
		return $(this).attr('title');
	});
	
	$('.operation-done a').live('click',function(){
		return false;
	})
	
	
	$('.pelena, .popup .popup-close').live('click',function(){
		$('.popup').fadeOut();
		$('.pelena').hide();
		activateHearth();
	})
	
	$('.operation a').live('click', function(){
		$('.pelena').show();
		$('.popup').fadeIn();
		reInitScroll();
		return false;
	})
	
	reInitScroll();
	
	$('.help-icon').hover(
		function(){
			$(this).find('.tooltip').stop(true, true).fadeIn();
		},
		function(){
			$(this).find('.tooltip').hide();
		}
	)
	
/* 	$('.popup').hide().css({'visibility':'visible'}) */
	
/* 	$('.good-block .counter').append('<span/>') */
})