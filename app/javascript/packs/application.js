// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function() {
    $(function(){
        const mouse = $("#js-mouse");
        $(document).on("mousemove",function(e){
            const x=e.clientX;
            const y=e.clientY;
            mouse.css({
                "opacity": "1",
                "transform": "translate(" + x + "px," + y + "px)",
            });
        });
    });
});