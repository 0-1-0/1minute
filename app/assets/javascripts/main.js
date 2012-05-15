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

	window.addEventListener("load",function() {
		// Set a timeout...
		setTimeout(function(){
			// Hide the address bar!
			window.scrollTo(0, 1);
		}, 0);
	});

	
	initPopupSlides = function(){		
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
	}
	initPopupSlides();
			
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
	})
	
	
	$('.operation a').live('click', function(){
		//go to clicked operation in popup
		clickedPos = $('.operation:not(.operation-done)').index($(this).parent());
		$('.popup-slider .pagination li').eq(clickedPos).find('a').click();
		$('.popup-slider .slides_control').stop(true,true);
		
		
		$('.pelena').show();
		$('.popup').fadeIn();

		reInitScroll();
		return false;
	})
	
	$('.btn-do').live('click', function(){
		$curSlide = $(this).parents('.popup-slide').eq(0); 
		donePos = $curSlide.index();
		console.log(donePos);
		$.ajax({
			url:'ajax.html',
			success: function(data){
				$curOperation = $('.operation:not(.operation-done)').eq(donePos);
				$curOperation.html(data);
				$curOperation.addClass('operation-done');
				$('.popup').fadeOut();
				$('.pelena').hide();
		
				$curSlide.remove();
				
				$('.popup-slider .next, .popup-slider .prev, .popup-slider .pagination').remove();
				$('.popup-slider .popup-slide').removeAttr('style');
				reHtml = $('.popup-slider .slides_control').html();
				$('.popup-slider .slides_container').html(reHtml);
				
				
				
				initPopupSlides();
			}
		})
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