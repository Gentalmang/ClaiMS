$().ready(function() {
    loadSex();
    loadJob();
    loadDoctor();
    validateRule();
});

$.validator.setDefaults({
    submitHandler : function() {
        var job=$("#job").val();
        var sex=$("#sex").val();
        if (sex==""||sex.length==0||sex==null) {
            layer.msg("Please Enter The Sex.");
            // alert("Please Enter The Sex.")
        }else{
            if (job==""||job.length==0||job==null) {
                layer.msg("Please Enter The Job tittle.");
                // alert("Please Enter The Job tittle.")
            }else{
                save();
            }
        }

    }
});
function save() {
    $.ajax({
        cache : true,
        type : "POST",
        url : "/oa/form/userSave",
        data : $('#signupForm').serialize(),//
        async : false,
        error : function(request) {
            parent.layer.alert("Connection error");
        },
        success : function(data) {
            if (data.code == 0) {
                parent.layer.msg("Succeed");
                parent.reLoad();
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);

            } else {
                parent.layer.alert(data.msg)
            }

        }
    });

}
function validateRule() {
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#signupForm").validate({
        rules : {
            name : {
                required : true
            }
        },
        messages : {
            name : {
                required : icon + "Please enter your name"
            }
        }
    })
}

function loadSex(){
    var html = "";
    $.ajax({
        url : '/common/dict/list/sex',
        success : function(data) {
            for (var i = 0; i < data.length; i++) {
                html += '<option value="' + data[i].value + '">' + data[i].name + '</option>'
            }
            $(".sex-select").append(html);
            $(".sex-select").chosen({
                maxHeight : 200
            });
        }
    });
}


function loadJob(){
    var html = "";
    $.ajax({
        url : '/claim/list/jobType',
        success : function(data) {
            for (var i = 0; i < data.length; i++) {
                html += '<option value="' + data[i].id + '">' + data[i].job + '</option>'
            }
            $(".job-select").append(html);
            $(".job-select").chosen({
                maxHeight : 200
            });
        }
    });
}


function loadDoctor(){
    var html = "";
    $.ajax({
        url : '/oa/doctor/getUserByPermission/oa:doctor:doctor',
        success : function(data) {
            for (var i = 0; i < data.length; i++) {
                html += '<option value="' + data[i].username + '">' + data[i].name + '</option>'
            }
            $(".doctor-select").append(html);
            $(".doctor-select").chosen({
                maxHeight : 200
            });
        }
    });
}

var openUser = function(){
    layer.open({
        type:2,
        title:"Select user",
        area : [ '300px', '450px' ],
        content:"/sys/user/treeView"
    })
}

function loadUser(userIds,userNames){
    $("#userIds").val(userIds);
    $("#userNames").val(userNames);
}