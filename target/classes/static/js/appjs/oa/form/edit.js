$().ready(function() {
    // loadSex();
	loadStatus();
	// loadJob();
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
		url : "/oa/form/updateByInsure",
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
			for (var i = 0; i < sel.length; i++) {
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
		}
	});
}

function loadSex(){
	var html = "";
	$.ajax({
		url : '/common/dict/list/sex',
		success : function(data) {
			// 加载数据
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

function loadColorDiscrimination(){
	var html = "";
	$.ajax({
		url : '/common/dict/list/oa_form_colorDiscrimination',
		success : function(data) {
			//加载数据
			for (var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].value + '">' + data[i].name + '</option>'
			}
			$(".colorDiscrimination-select").append(html);
			$(".colorDiscrimination-select").chosen({
				maxHeight : 200
			});
			$(".colorDiscrimination-select").val($("#vision").val());
			$(".colorDiscrimination-select").trigger("chosen:updated");
			// 点击事件
			$('.colorDiscrimination-select').on('change', function(e, params) {
			});
		}
	});
}

function loadVision(){
	var html = "";
	$.ajax({
		url : '/common/dict/list/oa_form_vision',
		success : function(data) {
			//加载数据
			for (var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].value + '">' + data[i].name + '</option>'
			}
			$(".vision-select").append(html);
			$(".vision-select").chosen({
				maxHeight : 200
			});
			$(".vision-select").val($("#vision").val());
			$(".vision-select").trigger("chosen:updated");
			// 点击事件
			$('.vision-select').on('change', function(e, params) {
			});
		}
	});
}

function loadHearing(){
	var html = "";
	$.ajax({
		url : '/common/dict/list/oa_form_hearing',
		success : function(data) {
			//加载数据
			for (var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].value + '">' + data[i].name + '</option>'
			}
			$(".hearing-select").append(html);
			$(".hearing-select").chosen({
				maxHeight : 200
			});
			$(".hearing-select").val($("#vision").val());
			$(".hearing-select").trigger("chosen:updated");
			// 点击事件
			$('.hearing-select').on('change', function(e, params) {
			});
		}
	});
}

function loadBodyPosition(){
	var html = "";
	$.ajax({
		url : '/common/dict/list/oa_form_bodyPosition',
		success : function(data) {
			//加载数据
			for (var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].value + '">' + data[i].name + '</option>'
			}
			$(".bodyPosition-select").append(html);
			$(".bodyPosition-select").chosen({
				maxHeight : 200
			});
			$(".bodyPosition-select").val($("#vision").val());
			$(".bodyPosition-select").trigger("chosen:updated");
			// 点击事件
			$('.bodyPosition-select').on('change', function(e, params) {
			});
		}
	});
}

function loadLimbCo(){
	var html = "";
	$.ajax({
		url : '/common/dict/list/oa_form_limbCo',
		success : function(data) {
			//加载数据
			for (var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].value + '">' + data[i].name + '</option>'
			}
			$(".limbCo-select").append(html);
			$(".limbCo-select").chosen({
				maxHeight : 200
			});
			$(".limbCo-select").val($("#vision").val());
			$(".limbCo-select").trigger("chosen:updated");
			// 点击事件
			$('.limbCo-select').on('change', function(e, params) {
			});
		}
	});
}

function loadStrength(){
	var html = "";
	$.ajax({
		url : '/common/dict/list/oa_form_strength',
		success : function(data) {
			//加载数据
			for (var i = 0; i < data.length; i++) {
				html += '<option value="' + data[i].value + '">' + data[i].name + '</option>'
			}
			$(".strength-select").append(html);
			$(".strength-select").chosen({
				maxHeight : 200
			});
			$(".strength-select").val($("#vision").val());
			$(".strength-select").trigger("chosen:updated");
			// 点击事件
			$('.strength-select').on('change', function(e, params) {
			});
		}
	});
}

function loadStatus(){
	var html = "";
	$.ajax({
		url : '/common/dict/list/oa_form_status',
		success : function(data) {
			//加载数据
			//加载数据
			var id = document.getElementById("status").getAttribute("value");
			console.log(id)
			var sel=new Array();
			for (var i=0;i<data.length;i++){
				if(data[i].value==id){
					sel.push(data[i]);
					break;
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
			$(".status-select").append(html);
			$(".status-select").chosen({
				maxHeight : 200
			});
			$(".status-select").val($("#status").val());
			$(".status-select").trigger("chosen:updated");
			// 点击事件
			$('.status-select').on('change', function(e, params) {
			});
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

