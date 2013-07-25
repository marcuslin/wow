$(document).ready(function() {
  $("#user").tooltip({
    selector: "a[equip-id]"
  });



  // $.ajax('/equipment/' + equipId + '.json', {
    //     datatype: 'json',
    //     success: function(result) {
    //       stats = result.new_equip_html;
    //     };
    //   $("#equip_data tittle").attr(stats);
    // });
  // $( "#user" ).tooltip({
  //   items: "[equip-id]",
  //   content: function() {
  //     var stats = '';
  //     var html = '';
  //     var element = $(this);
  //     var equipId = element.attr('id');



  //         html = "<div id='equip_details'><table id='test'><tr><td class='name'>" + result.equip_name + "</td></tr>" + stats + "</table></div>";
  //         console.log(html);
  //       }
  //     });

  //     return html;

  //   }
  // });
});