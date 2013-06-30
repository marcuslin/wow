$(document).ready(function() {
  $(".equip_data").click(function() {
    var equipId = $(this).attr('id');

    $.ajax('/equipment/' + equipId + '.json', {
      datatype: 'json',
      success: function(result) {
        var equip = jQuery.parseJSON(result);
        console.log(equip);
      }
    });


  });
})