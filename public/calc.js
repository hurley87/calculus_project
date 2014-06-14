
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
		
		$('#start').on('click', function() {
			setInterval(setTime, 1000);
		});
 		$('#submit').on('click', function() {
					$('#timer').val(totalSeconds);
 		});	

 		$('.q2').hide();
 		$('.q3').hide();
 		$('.q4').hide();
 		$('.q5').hide();
	
});