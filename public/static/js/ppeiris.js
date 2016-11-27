function formatDate() {
    var d = new Date(),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = String(d.getFullYear()).slice(-2);
    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;
    return [year, month, day].join('');
}

$("#apod").attr("src", ["http://apod.nasa.gov/apod/calendar/S_", formatDate(), ".jpg"].join(''));

console.log(formatDate());
