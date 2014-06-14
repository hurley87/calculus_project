		// code for the timer
    var totalSeconds = 0;
    function setTime()
    {
        ++totalSeconds;
        $("#minutes").text(pad(totalSeconds%60));
        $("#seconds").text(pad(parseInt(totalSeconds/60)));
    }

    function pad(val)
    {
        var valString = val + "";
        if(valString.length < 2)
        {
            return "0" + valString;
        }
        else
        {
            return valString;
        }
    }


$(document).ready(function() {

		// hide everything off the start
		$('.q1').hide();
 		$('.q2').hide(); 
 		$('.q3').hide();
 		$('.q4').hide();
 		$('.q5').hide();
 		$('#stopwatch').hide();
 		$('#submit').hide();

 		// focus cursor on name and show timers when user enters name
 		$('#name').focus();
 		$("#name").change(function() {
 			$('.name').hide(1000)
 			$('#stopwatch').show(2000);
 		});
	
			// when user clicks start the timer starts and the 
			// first question is shown
		$('#start').on('click', function() {
			setInterval(setTime, 1000);
			$('.q1').fadeIn(1000);
		});



 		$('#submit').on('click', function() {
					$('#timer').val(totalSeconds);
 		});	
 		

 		$("#calc_form").submit(function(e){
    		return false;
		});

		$("#start").on("click", function() {
					$(this).fadeOut();
		});

 		
});