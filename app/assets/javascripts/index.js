$(document).ready(function() {
  $("#user").tooltip({
    selector: "a[equip-id]"
  });
  // $( "#user" ).tooltip({
  //   items: "[equip-id]",
  //   content: function() {
  //     var stats = '';
  //     var html = '';
  //     var element = $(this);
  //     var equipId = element.attr('id');

  //     $.ajax('/equipment/' + equipId + '.json', {
  //       datatype: 'json',
  //       success: function(result) {
  //         var equipStat = $.each(result.new_equip_stat, function(k, v){
  //           stats += "<tr><td>" + v + "</td></tr>";
  //         });

  //         html = "<div id='equip_details'><table id='test'><tr><td class='name'>" + result.equip_name + "</td></tr>" + stats + "</table></div>";
  //         console.log(html);
  //       }
  //     });

  //     return html;

  //   }
  // });
});