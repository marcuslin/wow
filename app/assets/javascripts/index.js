$(document).ready(function() {
  $(".equip_data").click(function(e) {
    e.preventDefault();
    var equipId = $(this).attr('id');

    stats = ''
    $.ajax('/equipment/' + equipId + '.json', {
      datatype: 'json',
      success: function(result) {

        var equipStat = $.each(jQuery.parseJSON(result.equip_stat), function(k, v) {
          stats += "<p>" + "stat:" + v.stat + ", amount:" + v.amount + "</p>"
          console.log(stats);
        });

        var html = "<table id='test'><tr><td class='name'>" + result.equip_name + "</td></tr><tr><td>" + result.equip_class + "</td></tr><tr><td>" + stats + "</td></tr></table>";

        $('#equip_details').html(html);
      }
    });


  });
})