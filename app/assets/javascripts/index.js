$(document).ready(function() {
  $(".equip_data").click(function(e) {
    e.preventDefault();
    var equipId = $(this).attr('id');

    stats = ''
    statNum = ''
    statAmount = ''

    $.ajax('/equipment/' + equipId + '.json', {
      datatype: 'json',
      success: function(result) {


        var equipStat = $.each(jQuery.parseJSON(result.equip_stat), function(k, v){
          statNum = v.stat
          statAmount = v.amount

        })
        // , function(k, v) {
        for (i=0;i<result.new_equip_stat.length;i++) {
          if (statNum == 1 || statNum == 2 || statNum == 3 || statNum == 4 || statNum == 5 || statNum == 6 || statNum == 7) {
            stats += "<p>" + "+" + result.new_equip_stat[i].amount + " " + result.new_equip_stat[i].stat + "</p>"
          }

          else if (statNum == 49 || statNum == 13) {
            stats += "<p>" + result.new_equip_stat[i].stat + " " + result.new_equip_stat[i].amount + "</p>"
          }
        }
        // });
      console.log(statNum)
        var html = "<table id='test'><tr><td class='name'>" + result.equip_name + "</td></tr><tr><td>" + stats + "</td></tr></table>";

        $('#equip_details').html(html);
      }
    });
  });
})