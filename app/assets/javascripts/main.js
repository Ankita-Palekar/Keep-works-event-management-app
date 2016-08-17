function call_attendants(params) {
  $.ajax({
    url: 'attending',
    type: 'POST',
    data: params,
    dataType: 'json'
  }).done(function(data){
     result = data[0]
     $('#button-div').html(result[1])
  });
}

$(document).ready(function(){
  $('#eve-attending, #eve-not-attending').on('click', function(e){
    e.preventDefault()
    params =  {
                id: $(this).data('id'),
                status: Boolean($(this).data('status'))
              };
              call_attendants(params);
  })


})