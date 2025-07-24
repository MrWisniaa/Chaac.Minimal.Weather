function getCoordinates(city, callback) {
    var url = "https://geocoding-api.open-meteo.com/v1/search?count=1&name=" + encodeURIComponent(city);
    var req = new XMLHttpRequest();
    req.open("GET", url, true);
    req.onreadystatechange = function () {
        if (req.readyState === 4) {
            if (req.status === 200) {
                try {
                    var data = JSON.parse(req.responseText);
                    if (data && data.results && data.results.length > 0) {
                        var res = data.results[0];
                        callback(res.latitude + ", " + res.longitude);
                    } else {
                        console.error("City not found");
                        callback(null);
                    }
                } catch (e) {
                    console.error("Parse error", e);
                    callback(null);
                }
            } else {
                console.error("Request error: " + req.status);
                callback(null);
            }
        }
    };
    req.onerror = function () { callback(null); };
    req.send();
}
