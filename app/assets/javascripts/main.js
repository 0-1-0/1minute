$(document).ready(function(){
	var btnInterval = '';
	reInitScroll = function(){
		$('.popup .popup-slide: .scrollable').jScrollPane();
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
		activity_id = $(this).parent().attr('activity_id');

		//$curSlide = $('.popup-slider .popup-slide[activity_id='+activity_id+']');
		//curSlidePos = $('.popup-slide').index($curSlide);

		//alert('activity_id=' + activity_id + 'slide_pos=' + curSlidePos);

		//clickedPos = $('.operation:not(.operation-done)').index($(this).parent());
		$('.popup-slider .pagination li a[activity_id='+activity_id+']').click();
		$('.popup-slider .slides_control').stop(true,true);
		
		
		$('.pelena').show();
		$('.popup').fadeIn();

		reInitScroll();
		return false;
	})

		$('.btn-do-nb').live('click', function(){


				$('.popup').fadeOut();
				$('.pelena').hide();
		

	})
	
	$('.btn-do').live('click', function(){

		$curSlide = $(this).parents('.popup-slide').eq(0); 
		doneId = $curSlide.attr('activity_id');

				$curOperation = $('.operation:not(.operation-done)[activity_id='+doneId+']');
				$curOperation.find('.operation-hover').remove();
				$curOperation.addClass('operation-done');
				$curOperation.html($curOperation.find('a').html())

				$('.popup').fadeOut();
				$('.pelena').hide();
		
				$curSlide.remove();
				
				$('.popup-slider .next, .popup-slider .prev, .popup-slider .pagination').remove();
				$('.popup-slider .popup-slide').removeAttr('style');
				reHtml = $('.popup-slider .slides_control').html();
				$('.popup-slider .slides_container').html(reHtml);

				initPopupSlides();

	})

	$('.popup').hide();
	
	reInitScroll();
	
	$('.good-block').hover(
		function(){
			$(this).find('.tooltip').stop(true, true).fadeIn();
		},
		function(){
			$(this).find('.tooltip').hide();
		}
	)

	$('.gallery a').fancybox();
	
 	//.css({'visibility':'visible'})
	
/* 	$('.good-block .counter').append('<span/>') */
})