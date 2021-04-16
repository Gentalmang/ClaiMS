$().ready(function() {
    loadSex();
	loadJob();
	loadDoctor();

	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		update();
	}
});
function update() {
	$.ajax({
		cache : true,
		type : "POST",
		url : "/oa/form/userUpdate",
		data : $('#signupForm').serialize(),// 你的formid
		async : false,
		error : function(request) {
			parent.layer.alert("Connection error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("Succeed");
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);
			} else {
				parent.layer.alert(data.msg)
			}

		}
	});

}

function loadSex(){
	var html = "";
	$.ajax({
		url : '/common/dict/list/sex',
		success : function(data) {
			// 加载数据
			var id = document.getElementById("sex").getAttribute("value");
			var sel=new Array();
			for (var i=0;i<data.length;i++){
				if(data[i].value==id){
					sel.push(data[i]);
				}
			}
			for (var i=0;i<data.length;i++){
				if(data[i].value==id){
				}else{
					sel.push(data[i]);
				}
			}
			for (var i = 0; i < sel.length; i++) {
				html += '<option value="' + sel[i].value + '">' + sel[i].name + '</option>'
			}
			$(".sex-select").append(html);
			$(".sex-select").chosen({
				maxHeight : 200
			});
			$(".sex-select").val($("#sex").val());
			$(".sex-select").trigger("chosen:updated");
			// 点击事件
			$('.sex-select').on('change', function(e, params) {

			});
		}
	});
}

function loadJob(){
	var html = "";
	$.ajax({
		url : '/claim/list/jobType',
		success : function(data) {
			//加载数据
			var id = document.getElementById("job").getAttribute("value");
			var sel=new Array();
			for (var i=0;i<data.length;i++){
				if(data[i].id==id){
				sel.push(data[i]);
				}
			}
			for (var i=0;i<data.length;i++){
				if(data[i].id==id){
				}else{
					sel.push(data[i]);
				}
			}
			for (var i = 0; i < sel.length; i++) {
				html += '<option value="' + sel[i].id + '">' + sel[i].job + '</option>'
			}
			$(".job-select").append(html);
			$(".job-select").chosen({
				maxHeight : 200
			});
			$(".job-select").val($("#job").val());
			$(".job-select").trigger("chosen:updated");

			// var id = document.getElementById("job").getAttribute("value");
			// console.log(id)
			// $("#job option").each(
			// 	function () {
			// 		var val=$(this).val();
			// 		if(val==id){
			// 			// console.log(val)
			// 			$(this).attr("selected", true);
			// 			return;
			// 		}
			// 	}
			// )

		}
	});
}

function loadDoctor(){
	var html = "";
	$.ajax({
		url : '/oa/doctor/getUserByPermission/oa:doctor:doctor',
		success : function(data) {
			//加载数据
			var id = document.getElementById("doctor_name").getAttribute("value");
			var sel=new Array();
			for (var i=0;i<data.length;i++){
				if(data[i].username==id){
					sel.push(data[i]);
				}
			}
			for (var i=0;i<data.length;i++){
				if(data[i].username==id){
				}else{
					sel.push(data[i]);
				}
			}

			for (var i = 0; i < data.length; i++) {
				html += '<option value="' + sel[i].username + '">' + sel[i].name + '</option>'
			}
			$(".doctor-select").append(html);
			$(".doctor-select").chosen({
				maxHeight : 200
			});
			$(".doctor-select").val($("#doctor_name").val());
			$(".doctor-select").trigger("chosen:updated");
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
				required : icon + "Please enter the name"
			}
		}
	})
}

