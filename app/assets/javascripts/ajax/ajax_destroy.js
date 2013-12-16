    $('form.ajaxtables').on('click', 'a', function(e){
	e.preventDefault();
	e.stopImmediatePropagation();
	url = $(this).attr('href');

	$.ajax({
	    type: 'delete',
	    url: url,
	    dataType: 'json',
	    success: function(obj){

		error_row_selector   = '#' + obj.plural + '_errors_row';
		deleted_row_selector = '#' + obj.singular + obj.id;

		// Hide previous errors.
		$(error_row_selector).hide();

		// Fade out deleted row
		$(deleted_row_selector).fadeOut();
	    },
	    error: function(xhr){

		obj                        = $.parseJSON(xhr.responseText)
		error_row_id               = obj.plural + '_errors_row';
		error_row_selector         = '#' + error_row_id;
		we_already_have_errors_row = $(error_row_selector).length;
		error_row_td_selector      = error_row_selector + ' td';
		table_selector             = '#' + obj.plural + '_table';
		errors                     = obj.errors;
		errors_row                 = '<tr id="' + error_row_id + '"><td colspan = "'+obj.colspan+'">'+errors+'</td></tr>';
		last_row_selector          = table_selector + ' tr:last';

		if(we_already_have_errors_row)
		{
		    // Change text 
		    $(error_row_td_selector).text(errors);

		    // Fade it 
		    $(error_row_selector).hide().fadeIn();
		}
		else
		{
		    // Add errors row
		    $(table_selector).append(errors_row);

		    // Fade it
		    $(last_row_selector).hide().fadeIn();
		}
	    }//error
	})//ajax
    })//link clicked
