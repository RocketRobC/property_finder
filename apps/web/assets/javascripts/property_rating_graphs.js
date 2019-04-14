function getDataAndChart() {
  var url_array = document.URL.split('/');
  var property_id = url_array[url_array.length - 1];

  $.ajax({
    url: document.URL + '/rating_data',
    context: document.body,
    data: {
      property_id: property_id,
    },
    dataType: 'json',
    success: function(data) {
      loadChart(data);
    },
  });
}

function loadChart(data) {
  var chart = {
    type: 'horizontalBar',
    data: {
      labels: data.map(obj => {
        return obj.criteria_description;
      }),
      datasets: [
        {
          label: 'Average score',
          data: data.map(obj => {
            return obj.weighted_avg;
          }),
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)',
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)',
          ],
          borderWidth: 1,
        },
      ],
    },
    options: {
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: true,
            },
          },
        ],
      },
    },
  };

  var ctx = document.getElementById('property-ratings');

  if (ctx) {
    new Chart(ctx, chart);
  }
}
$(document).ready(function() {
  getDataAndChart();
});
