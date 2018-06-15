// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require channels/conversation
//= require bootstrap-sprockets
//= require_tree .


function create(val) {
    let div = document.createElement("div");
    let left = document.createElement("div");
    let right=document.createElement("div");
    let img = document.createElement("img");
    let p = document.createElement("p");
    img.style.width="30px";
    img.style.height="30px";
    img.src=val.logo;
    left.appendChild(img);
    p.appendChild(document.createTextNode(val.title));
    right.appendChild(p);
    right.className="py-auto";
    left.className="mr-3";
    div.appendChild(left);
    div.appendChild(right);
    div.className="row";
    let a = document.createElement("a");
    a.href=val.url;
    a.className="dropdown-item";
    a.appendChild(div);
    return a;
}


$(document).ready(hightlight_active);
$(document).on('turbolinks:load',hightlight_active);
function get_token() {
    var data = {};
    var token_name = $("meta[name=csrf-param]").attr("content");
    var token_content = $("meta[name=csrf-token]").attr("content");
    data[token_name] = token_content;

    return data;
}

function follow() {
    var followed_id = $("#follow-ajax").find("#follow-data-id")[0].value;

    var data=get_token();
    data.followed_id = followed_id;
    data["_method"] = "create";

    var opt={};
    opt.data=data;
    opt.type="post";

    opt.success = function () {
        $("#follow-ajax").find("#follow-data-status")[0].value="true";
        $("#follow-unfollow").html("unfollow");
    }

    $.ajax("/follows/",opt);
}

function unfollow() {
    var followed_id = $("#follow-ajax").find("#follow-data-id")[0].value;

    var data=get_token();
    data.followed_id = followed_id;
    data["_method"] = "delete";

    var opt={};
    opt.data=data;
    opt.type="post";

    //console.log(opt);
    opt.success = function () {
        $("#follow-ajax").find("#follow-data-status")[0].value="false";

        $("#follow-unfollow").html("follow");
    }

    $.ajax(`/follows/${followed_id}`,opt);
}


function handle() {
    $(this).blur();
    var is_following =  $("#follow-ajax").find("#follow-data-status")[0].value=="true";
    //console.log({is_following});
    if(is_following) {
        unfollow()
    }else {
        follow();
    }
}
$(document).ready(function() {
   $("#follow-unfollow").click(handle);
})

function ajax_search(){
    var lastest_query="";
    $("#header-search-input").on("input",function(){
        var value = $(this).val().trim();
        if(value == lastest_query) return;
        lastest_query = value;
        if(!value) return;

        var div_dropdown = document.querySelector("#header-search-result");
        //
        $.get({
            url:"/search.json",
            data:{"q[title_cont]":value},
            success: function(result) {
                div_dropdown.innerHTML="";
                //console.log(result);
                result.forEach(function(val,index){
                    console.log(val);


                    div_dropdown.appendChild(create(val));
                });
            },
            fail: function(){
                console.log("fail");
            },

        });

    });

    $("#header-search-form").on("submit",function(){
        return false;
    });
};
$(document).ready(ajax_search);
$(document).on("page:load",ajax_search);
