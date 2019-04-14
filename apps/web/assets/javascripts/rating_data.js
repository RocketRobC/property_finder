var url_array = document.URL.split('/')
var property_id = url_array[url_array.length - 1]

function get_data() {
  var response = $.ajax({
    url: document.URL + '/rating_data',
    context: document.body,
    data: {
      property_id: property_id
    },
    dataType: 'json',
    success: function(data){
      window.InitData = data;
    }
  });
};

get_data();

var ratingGraph = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: window.InitData.map(obj =>{ return obj.criteria_description }),
    datasets: [window.InitData.map(obj =>{ return obj.weighted_avg })],
  }
});
