$(document).ready(function() {
  $(".equip_data").click(function(e) {
    e.preventDefault();
    var equipId = $(this).attr('id');

    $.ajax('/equipment/' + equipId + '.json', {
      datatype: 'json',
      success: function(result) {

        var equipStat = $.each(result.equip_stat, function(v) {
          alert.log(v.stat);
        });

        var html = "<table id='test'><tr><td class='name'>" + result.equip_name + "</td></tr><tr><td>" + result.equip_class + "</td></tr><tr><td>" + equipStat + "</td></tr></table>";

        $('#equip_details').html(html);
      }
    });


  });
})