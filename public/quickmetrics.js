//QuickMetrics snippet to put in tracked application

var quickmetrics = (function () {
    var my = {};
    _qm_event = {};

    my.track = function(name) {
            _qm_event.name = name;
            _send_data();
    };

    function _send_data() {
        _qm_request = new XMLHttpRequest();
        // _qm_request.open("POST", "https://quickmetrics.herokuapp.com/api/events", true);
        _qm_request.open("POST", "http://localhost:3000/api/events", true);
        _qm_request.setRequestHeader('Content-Type', 'application/json');
        _qm_request.onreadystatechange = function () {
            // don't do anything here, we don't want to interfere with the behavior of the host site
        };
        _qm_request.send(JSON.stringify(_qm_event));
    };

    return my;
})();

// Test for curl via app running on localhost:4000

//curl -v -H "Accept: application/json" -H "Origin: http://localhost:4000" -H "Content-Type: application/json" -X POST -d '{"event": {"name":"test_report"}}' http://localhost:3000/api/events
