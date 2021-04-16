form.htmlA
var prefix = "/oa/notify"
$(function() {
	load();
});

function load() {
	$('#exampleTable')
		.bootstrapTable(
			{
				method : 'get', // 服务器数据的请求方式 get or post
				url : prefix + "/selfList", // 服务器数据的加载地址
				//	showRefresh : true,
				//	showToggle : true,
				//	showColumns : true,
				iconSize : 'outline',
				toolbar : '#exampleToolbar',
				striped : true, // 设置为true会有隔行变色效果
				dataType : "json", // 服务器返回的数据类型
				pagination : true, // 设置为true会在底部显示分页条
				// queryParamsType : "limit",
				// //设置为limit则会发送符合RESTFull格式的参数
				singleSelect : false, // 设置为true将禁止多选
				// contentType : "application/x-www-form-urlencoded",
				// //发送到服务器的数据编码类型
				pageSize : 10, // 如果设置了分页，每页数据条数
				pageNumber : 1, // 如果设置了分布，首页页码
				//search : true, // 是否显示搜索框
				showColumns : false, // 是否显示内容下拉框（选择显示的列）
				sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
				queryParams : function(params) {
					return {
						//说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
						limit : params.limit,
						offset : params.offset
					// name:$('#searchName').val(),
					// username:$('#searchName').val()
					};
				},
				// //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 如果
				// queryParamsType = 'limit' ,返回参数必须包含
				// limit, offset, search, sort, order 否则, 需要包含:
				// pageSize, pageNumber, searchText, sortName,
				// sortOrder.
				// 返回false将会终止请求
				columns : [
					{
						checkbox : true
					},
					{
						visible : false,
						field : 'id',
						title : 'ID'
					},
					{
						visible :false,
						field : 'type',
						title : 'Type'
					},
					{
						field : 'title',
						width: '20%',
						title : 'Tittle',
						formatter:function (value,row,index) {
                            return '<a href="#" onclick="read(\''+ row.id+ '\')">'+row.title+'</a>';
                        }
					},
					{
						field : 'content',
						width: '30%',
						title : 'Centent'
					},
					{
						visible : false,
						field : 'files',
						title : 'Attached'
					},
					{
						field : 'isRead',
						title : 'Status',
						align :'center',
						formatter : function(value, row, index){
							if(value==0){
								return '<span class="label label-warning">未读</span>';
							}else if(value==1){
								return '<span class="label label-primary">已读</span>';
							}
						}
					},
					{
						visible : false,
						field : 'createBy',
						title : 'Creator'
					},
					{
						visible : false,
						field : 'createDate',
						title : 'Create date'
					},
					{
						visible : false,
						field : 'updateBy',
						title : 'Updater'
					},
					{
						visible : false,
						field : 'updateDate',
						title : 'Update date'
					},
					{
						field : 'remarks',
						title : 'Remarks'
					},
					{
						visible : false,
						field : 'delFlag',
						title : 'Delete flag'
					},
					{
						title : 'Operation',
						field : 'opera',
						align : 'center',
						formatter : function(value, row, index) {
							var e = '<a class="btn btn-primary btn-sm" href="#" mce_href="#" title="Open" onclick="read(\''
								+ row.id
								+ '\')"><i class="fa fa-book"></i></a> ';
							var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="Delete"  mce_href="#" onclick="remove(\''
								+ row.id
								+ '\')"><i class="fa fa-remove"></i></a> ';
							var f = '<a class="btn btn-success btn-sm" href="#" title="Backup"  mce_href="#" onclick="resetPwd(\''
								+ row.id
								+ '\')"><i class="fa fa-key"></i></a> ';
							return e ;
						}
					} ]
			});
}
function reLoad() {
	$('#exampleTable').bootstrapTable('refresh');
}
function add() {
	layer.open({
		type : 2,
		title : 'Add',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/add' // iframe的url
	});
}
function read(id) {
	layer.open({
		type : 2,
		title : 'View',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/read/' + id // iframe的url
	});
}
function remove(id) {
	layer.confirm('Confirm to delete the selected record？', {
		btn : [ 'Confirm', 'Cancel' ]
	}, function() {
		$.ajax({
			url : prefix + "/remove",
			type : "post",
			data : {
				'id' : id
			},
			success : function(r) {
				if (r.code == 0) {
					layer.msg(r.msg);
					reLoad();
				} else {
					layer.msg(r.msg);
				}
			}
		});
	})
}

function resetPwd(id) {
}
function batchRemove() {
	var rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
	if (rows.length == 0) {
		layer.msg("Please select the data to be deleted");
		return;
	}
	layer.confirm("Confirm to delete the selected'" + rows.length + "'data??", {
		btn : [ 'Confirm', 'Cancel' ]
	// 按钮
	}, function() {
		var ids = new Array();
		// 遍历所有选择的行数据，取每条数据对应的ID
		$.each(rows, function(i, row) {
			ids[i] = row['id'];
		});
		$.ajax({
			type : 'POST',
			data : {
				"ids" : ids
			},
			url : prefix + '/batchRemove',
			success : function(r) {
				if (r.code == 0) {
					layer.msg(r.msg);
					reLoad();
				} else {
					layer.msg(r.msg);
				}
			}
		});
	}, function() {});
}