export default class AppCtrl {
  constructor() {
    on('.search', 'keyup', (e) => {
      // if (e.code !== 'Enter' || e.target.value == '')  return
      searchItem(e.target.value)
    })
  }

  searchItem(value) {
    var row = ''
    $(".table tbody tr").each(function(index) {
            row = $(this);

            var doctorFN = row.find("td:nth-child(1)").text();
            var doctorLN = row.find("td:nth-child(2)").text();
            var cityName = row.find("td:nth-child(4)").text();
            if (doctorFN.toUpperCase().indexOf(value.toUpperCase()) > -1 || doctorLN.toUpperCase().indexOf(value.toUpperCase()) > -1 || cityName.toUpperCase().indexOf(value.toUpperCase()) > -1) {
                $(this).show();
            }
            else {
                $(this).hide();
            }
    });
  }
}