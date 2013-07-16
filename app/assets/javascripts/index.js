$(document).ready(function() {
  $( "#user" ).tooltip({
    items: "[equip-id]",
    content: function() {
      var element = $(this);
      return element.attr('id');
    }
  });
  // $(".equip_data").click(function(e) {
  //
  //   var equipId = $(this).attr('id');

  //   stats = ''

  //   $.ajax('/equipment/' + equipId + '.json', {
  //     datatype: 'json',
  //     success: function(result) {

  //       var equipStat = $.each(result.new_equip_stat, function(k, v){
  //         stats += "<tr><td>" + v + "</td></tr>"
  //       });

  //       var html = "<table id='test'><tr><td class='name'>" + result.equip_name + "</td></tr>" + stats + "</table>";

  //       $('#equip_details').html(html);
  //     }
  //   });
  // });
});