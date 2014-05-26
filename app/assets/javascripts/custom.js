$(function() {

	/* Open Edit Password field in user edit page */
	$('.newpasswordopen').on('click', function() {
		$('.newpassword').slideToggle();
	});
	
	$('.show-inactive-participated-projects').on('click', function(){
		$('.inactive-participated-projects').slideToggle();
	});
	
	
	$('.input-group.date').datepicker({
		"format" : "dd-mm-yyyy",
		"autoclose" : true,
		"todayBtn" : "linked",
		"calendarWeeks" : true,
		"todayHighlight" : true,
		"endDate" : "0d",
	});
	
	$('.view-day').change(function(){
		$('.view-day-form').submit();
	});
	

});
