// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap

//QuickMetrics snippet to put in tracked application

$(document).ready( function(){
  var _bm_event = {
    event: { name: "pageLoad"},
  }

  var _bm_request = new XMLHttpRequest();
  _bm_request.open("POST", "https://quickmetrics.herokuapp.com//api/events", true);
  _bm_request.setRequestHeader('Content-Type', 'application/json');
  _bm_request.onreadystatechange = function() {
    // respond to controller finish events
  };
  _bm_request.send(JSON.stringify(_bm_event));
});