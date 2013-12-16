
$('form.ajaxtables').submit(function(event){
    event.preventDefault();
    event.stopImmediatePropagation();    
    url = $(this).attr('action');

    data = {};
    $(this).find('[name]').each(function(input){
	name = this.name;
	excludes = ['utf8', 'authenticity_token', 'commit'];
	if(excludes.indexOf(name) == -1)
	{
	    mainobj_length = name.indexOf('['); 
	    mainobj        = name.substr(0, mainobj_length); 
	    attr_length    = name.length - mainobj.length - 2;
	    attr           = name.substr(mainobj_length+1, attr_length);

	    if(!data[mainobj])
	    {
		data[mainobj] = {};
	    }

	    data[mainobj][attr] = this.value;
	}
    })

    $.ajax({
	type: 'post',
	url: url,
	data: data,
	dataType: 'json',
	success: function(obj){

	    tds = '';
	    for (var key in obj.ruby_obj) {
		value = obj.ruby_obj[key];
		if(key != 'id'){
		    tds += '<td>'+value+'</td>';
		}
	    }
	    tds += '<td><a href="'+obj.path+'/'+obj.ruby_obj.id+'" data-method="delete" rel="nofollow">Destroy</a></td>';

	    error_row_selector      = '#' + obj.plural + '_errors_row';
	    added_row_id            = obj.singular + obj.ruby_obj.id;
	    new_row                 = '<tr class="ajaxfields" id="' + added_row_id + '">' + tds + '</tr>';
	    add_object_row_selector = '#new_'+obj.singular+'_row';
	    added_row_selector      = '#'+added_row_id;

	    // Hide previous errors.
	    $(error_row_selector).hide();

	    // Add new row
	    $(new_row).insertBefore(add_object_row_selector);

	    // Fade it
	    $(added_row_selector).hide().fadeIn();
	},
	error: function(xhr){
	    obj                        = $.parseJSON(xhr.responseText)
	    error_row_selector         = '#' + obj.plural + '_errors_row';
	    we_already_have_errors_row = $(error_row_selector).length;
	    msg_selector               = error_row_selector + ' td';
	    table_selector             = '#' + obj.plural + '_table';
	    errors_row                 = '<tr id="'+error_row_selector.substr(1)+'"><td colspan="'+obj.colspan+'">'+obj.errors+'</td></tr>';

	    if(we_already_have_errors_row)
	    {
		// Change text in its td 
		$(msg_selector).text(obj.errors);

		// Fade tr itself 
		$(error_row_selector).hide().fadeIn();
	    }
	    else
	    {
		// Add errors row
		$(table_selector).append(errors_row);

		// Fade it
		$(error_row_selector).hide().fadeIn();
	    }
	}//error
    });//ajax
});//form submit
