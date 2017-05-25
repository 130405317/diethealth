function addFood(){
//		$('#mianfoodpanel').append('<div class="weui_cell weui_cell_select weui_select_before"><div class="weui_cell_hd">'
//		+'<select class="weui_select" name="select2"><option value="1">米饭1</option><option value="2">面食</option>'
//		+'<option value="3">火锅</option></select></div><div class="weui_cell_bd weui_cell_primary">'
//		+'<input class="weui_input" type="number" placeholder="请输入食量（克）" /></div></div>');
//		alert($('#mianfoodpanel').attr('class'));
	$.get(path+ '/food.json', function(data){
		 var foods = data.foods;
		 alert($('select[name=mainfoodselect]').attr('class'));
		 $('select[name=mainfoodselect]').append(foods[0]);
		});
	
	$.ajax({
		  type: 'GET',
		  url: path+ '/food.json',
//		  data: { name: 'Zepto.js' },
		  dataType: 'json',
		  timeout: 300,
//		  context: $('body'),
		  success: function(data){
			  var foods = data.foods;
				 alert($('select[name=mainfoodselect]').attr('class'));
				 $('select[name=mainfoodselect]').append(foods[0]);
		  },
		  error: function(xhr, type){
		    alert('Ajax error!')
		  }
		})
		
	}