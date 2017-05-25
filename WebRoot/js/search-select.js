var mainfood_data = [];
var mainfood_data_name = [];
var mainfood_select1 = [];
var mainfood_select2 = [];
var mainfood_select3 = [];
var mainfood_select4 = [];
var mainfood_select5 = [];
var meat_data = [];
var meat_data_name = [];
var meat_select1 = [];
var meat_select2 = [];
var meat_select3 = [];
var meat_select4 = [];
var meat_select5 = [];
var vegetables_data = [];
var vegetables_data_name = [];
var vegetables_select1 = [];
var vegetables_select2 = [];
var vegetables_select3 = [];
var vegetables_select4 = [];
var vegetables_select5 = [];
var vegetables_select6 = [];
var vegetables_select7 = [];
var vegetables_select8 = [];
var vegetables_select9 = [];
var vegetables_select10 = [];
var drink_data = [];
var drink_data_name = [];
var drink_select1 = [];
var drink_select2 = [];
var drink_select3 = [];
var drink_select4 = [];
var drink_select5 = [];
var nut_data = [];
var nut_data_name = [];
var nut_select1 = [];
var nut_select2 = [];
var nut_select3 = [];
var nut_select4 = [];
var nut_select5 = [];
var fruits_data = [];
var fruits_data_name = [];
var fruits_select1 = [];
var fruits_select2 = [];
var fruits_select3 = [];
var fruits_select4 = [];
var fruits_select5 = [];

$("#pageone").bind("pageshow", function(e) {
	$.ajax({
		data : null,
		type : "GET",
		dataType : 'json',
		url : "../diet/mainfood",
		error : function() {
			alert("出错了！！");
		},
		success : function(data) {
			for (i = 0; i < data.length; i++) {
				mainfood_data[i] = data[i];
				mainfood_data_name[i] = data[i].name+"["+data[i].pinyin+"]";
			}
		}
	});
	
	$.ajax({
		data : null,
		type : "GET",
		dataType : 'json',
		url : "../diet/meat",
		error : function() {
			alert("出错了！！");
		},
		success : function(data) {
			for (i = 0; i < data.length; i++) {
				meat_data[i] = data[i];
				meat_data_name[i] = data[i].name+"["+data[i].pinyin+"]";
			}
			
		}
	});

	$.ajax({
		data : null,
		type : "GET",
		dataType : 'json',
		url : "../diet/vegetables",
		error : function() {
			alert("出错了！！");
		},
		success : function(data) {
			for (i = 0; i < data.length; i++) {
				vegetables_data[i] = data[i];
				vegetables_data_name[i] = data[i].name+"["+data[i].pinyin+"]";
			}
		}
	});

	$.ajax({
		data : null,
		type : "GET",
		dataType : 'json',
		url : "../diet/drink",
		error : function() {
			alert("出错了！！");
		},
		success : function(data) {
			for (i = 0; i < data.length; i++) {
				drink_data[i] = data[i];
				drink_data_name[i] = data[i].name+"["+data[i].pinyin+"]";
			}
		}
	});

	$.ajax({
		data : null,
		type : "GET",
		dataType : 'json',
		url : "../diet/nut",
		error : function() {
			alert("出错了！！");
		},
		success : function(data) {
			for (i = 0; i < data.length; i++) {
				nut_data[i] = data[i];
				nut_data_name[i] = data[i].name+"["+data[i].pinyin+"]";
			}
		}
	});

	$.ajax({
		data : null,
		type : "GET",
		dataType : 'json',
		url : "../diet/fruits",
		error : function() {
			alert("出错了！！");
		},
		success : function(data) {
			for (i = 0; i < data.length; i++) {
				fruits_data[i] = data[i];
				fruits_data_name[i] = data[i].name+"["+data[i].pinyin+"]";
			}
		}
	});
	
	$("#searchField_mainfood1").autocomplete({
		target : $('#suggestions_mainfood1'),
		source : mainfood_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < mainfood_data.length; j++) {
				if ($a.text() == mainfood_data[j].name) {
					mainfood_select1[0] = mainfood_data[j].id;
					mainfood_select1[1] = mainfood_data[j].name;
					mainfood_select1[2] = mainfood_data[j].energy;
					mainfood_select1[3] = mainfood_data[j].protein;
					mainfood_select1[4] = mainfood_data[j].fat;
					mainfood_select1[5] = mainfood_data[j].carbohydrate;
					mainfood_select1[6] = mainfood_data[j].cellulose;
					mainfood_select1[7] = mainfood_data[j].calcium;
					mainfood_select1[8] = mainfood_data[j].ferrum;
					mainfood_select1[9] = mainfood_data[j].zinc;
					mainfood_select1[10] = mainfood_data[j].carotene;
					typechange('mainfood', '1', mainfood_select1);
				}
			} 
			$('#searchField_mainfood1').val($a.text()); // place the value of
														// the search box
			$("#searchField_mainfood1").autocomplete('clear'); // clear the
																// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#mainfood1_div').show();
			$('#searchField_mainfood1').val("");
		}
		
	});

	$('#mainfoodnum1').change(function() {
		numberchange(this.value, 'mainfood', '1', mainfood_select1);
	});

	$("#searchField_mainfood2").autocomplete({
		target : $('#suggestions_mainfood2'),
		source : mainfood_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < mainfood_data.length; j++) {
				if ($a.text() == mainfood_data[j].name) {
					mainfood_select2[0] = mainfood_data[j].id;
					mainfood_select2[1] = mainfood_data[j].name;
					mainfood_select2[2] = mainfood_data[j].energy;
					mainfood_select2[3] = mainfood_data[j].protein;
					mainfood_select2[4] = mainfood_data[j].fat;
					mainfood_select2[5] = mainfood_data[j].carbohydrate;
					mainfood_select2[6] = mainfood_data[j].cellulose;
					mainfood_select2[7] = mainfood_data[j].calcium;
					mainfood_select2[8] = mainfood_data[j].ferrum;
					mainfood_select2[9] = mainfood_data[j].zinc;
					mainfood_select2[10] = mainfood_data[j].carotene;
					typechange('mainfood', '2', mainfood_select2);
				}
			}
			$('#searchField_mainfood2').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_mainfood2").autocomplete('clear'); // clear the
																// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#mainfood2_div').show();
			$('#searchField_mainfood2').val("");
			return;
		}
	});

	$('#mainfoodnum2').change(function() {
		numberchange(this.value, 'mainfood', '2', mainfood_select2);
	});

	$("#searchField_mainfood3").autocomplete({
		target : $('#suggestions_mainfood3'),
		source : mainfood_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < mainfood_data.length; j++) {
				if ($a.text() == mainfood_data[j].name) {
					mainfood_select3[0] = mainfood_data[j].id;
					mainfood_select3[1] = mainfood_data[j].name;
					mainfood_select3[2] = mainfood_data[j].energy;
					mainfood_select3[3] = mainfood_data[j].protein;
					mainfood_select3[4] = mainfood_data[j].fat;
					mainfood_select3[5] = mainfood_data[j].carbohydrate;
					mainfood_select3[6] = mainfood_data[j].cellulose;
					mainfood_select3[7] = mainfood_data[j].calcium;
					mainfood_select3[8] = mainfood_data[j].ferrum;
					mainfood_select3[9] = mainfood_data[j].zinc;
					mainfood_select3[10] = mainfood_data[j].carotene;
					typechange('mainfood', '3', mainfood_select3);
				}
			}
			$('#searchField_mainfood3').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_mainfood3").autocomplete('clear'); // clear the
																// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#mainfood3_div').show();
			$('#searchField_mainfood3').val("");
			return;
		}
	});

	$('#mainfoodnum3').change(function() {
		numberchange(this.value, 'mainfood', '3', mainfood_select3);
	});

	$("#searchField_mainfood4").autocomplete({
		target : $('#suggestions_mainfood4'),
		source : mainfood_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < mainfood_data.length; j++) {
				if ($a.text() == mainfood_data[j].name) {
					mainfood_select4[0] = mainfood_data[j].id;
					mainfood_select4[1] = mainfood_data[j].name;
					mainfood_select4[2] = mainfood_data[j].energy;
					mainfood_select4[3] = mainfood_data[j].protein;
					mainfood_select4[4] = mainfood_data[j].fat;
					mainfood_select4[5] = mainfood_data[j].carbohydrate;
					mainfood_select4[6] = mainfood_data[j].cellulose;
					mainfood_select4[7] = mainfood_data[j].calcium;
					mainfood_select4[8] = mainfood_data[j].ferrum;
					mainfood_select4[9] = mainfood_data[j].zinc;
					mainfood_select4[10] = mainfood_data[j].carotene;
					typechange('mainfood', '4', mainfood_select4);
				}
			}
			$('#searchField_mainfood4').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_mainfood4").autocomplete('clear'); // clear the
																// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#mainfood4_div').show();
			$('#searchField_mainfood4').val("");
			return;
		}
	});

	$('#mainfoodnum4').change(function() {
		numberchange(this.value, 'mainfood', '4', mainfood_select4);
	});

	$("#searchField_mainfood5").autocomplete({
		target : $('#suggestions_mainfood5'),
		source : mainfood_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < mainfood_data.length; j++) {
				if ($a.text() == mainfood_data[j].name) {
					mainfood_select5[0] = mainfood_data[j].id;
					mainfood_select5[1] = mainfood_data[j].name;
					mainfood_select5[2] = mainfood_data[j].energy;
					mainfood_select5[3] = mainfood_data[j].protein;
					mainfood_select5[4] = mainfood_data[j].fat;
					mainfood_select5[5] = mainfood_data[j].carbohydrate;
					mainfood_select5[6] = mainfood_data[j].cellulose;
					mainfood_select5[7] = mainfood_data[j].calcium;
					mainfood_select5[8] = mainfood_data[j].ferrum;
					mainfood_select5[9] = mainfood_data[j].zinc;
					mainfood_select5[10] = mainfood_data[j].carotene;
					typechange('mainfood', '5', mainfood_select5);
				}
			}
			$('#searchField_mainfood5').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_mainfood5").autocomplete('clear'); // clear the
																// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#mainfood5_div').show();
			$('#searchField_mainfood5').val("");
			return;
		}
	});

	$('#mainfoodnum5').change(function() {
		numberchange(this.value, 'mainfood', '5', mainfood_select5);
	});

	$("#searchField_meat1").autocomplete({
		target : $('#suggestions_meat1'),
		source : meat_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < meat_data.length; j++) {
				if ($a.text() == meat_data[j].name) {
					meat_select1[0] = meat_data[j].id;
					meat_select1[1] = meat_data[j].name;
					meat_select1[2] = meat_data[j].energy;
					meat_select1[3] = meat_data[j].protein;
					meat_select1[4] = meat_data[j].fat;
					meat_select1[5] = meat_data[j].carbohydrate;
					meat_select1[6] = meat_data[j].cellulose;
					meat_select1[7] = meat_data[j].calcium;
					meat_select1[8] = meat_data[j].ferrum;
					meat_select1[9] = meat_data[j].zinc;
					meat_select1[10] = meat_data[j].carotene;
					typechange('meat', '1', meat_select1);
				}
			}
			$('#searchField_meat1').val($a.text()); // place the value of the
													// selection into the search
													// box
			$("#searchField_meat1").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#meat1_div').show();
			$('#searchField_meat1').val("");
			return;
		}
	});

	$('#meatnum1').change(function() {
		numberchange(this.value, 'meat', '1', meat_select1);
	});

	$("#searchField_meat2").autocomplete({
		target : $('#suggestions_meat2'),
		source : meat_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < meat_data.length; j++) {
				if ($a.text() == meat_data[j].name) {
					meat_select2[0] = meat_data[j].id;
					meat_select2[1] = meat_data[j].name;
					meat_select2[2] = meat_data[j].energy;
					meat_select2[3] = meat_data[j].protein;
					meat_select2[4] = meat_data[j].fat;
					meat_select2[5] = meat_data[j].carbohydrate;
					meat_select2[6] = meat_data[j].cellulose;
					meat_select2[7] = meat_data[j].calcium;
					meat_select2[8] = meat_data[j].ferrum;
					meat_select2[9] = meat_data[j].zinc;
					meat_select2[10] = meat_data[j].carotene;
					typechange('meat', '2', meat_select2);
				}
			}
			$('#searchField_meat2').val($a.text()); // place the value of the
													// selection into the search
													// box
			$("#searchField_meat2").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#meat2_div').show();
			$('#searchField_meat2').val("");
			return;
		}
	});

	$('#meatnum2').change(function() {
		numberchange(this.value, 'meat', '2', meat_select2);
	});

	$("#searchField_meat3").autocomplete({
		target : $('#suggestions_meat3'),
		source : meat_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < meat_data.length; j++) {
				if ($a.text() == meat_data[j].name) {
					meat_select3[0] = meat_data[j].id;
					meat_select3[1] = meat_data[j].name;
					meat_select3[2] = meat_data[j].energy;
					meat_select3[3] = meat_data[j].protein;
					meat_select3[4] = meat_data[j].fat;
					meat_select3[5] = meat_data[j].carbohydrate;
					meat_select3[6] = meat_data[j].cellulose;
					meat_select3[7] = meat_data[j].calcium;
					meat_select3[8] = meat_data[j].ferrum;
					meat_select3[9] = meat_data[j].zinc;
					meat_select3[10] = meat_data[j].carotene;
					typechange('meat', '3', meat_select3);
				}
			}
			$('#searchField_meat3').val($a.text()); // place the value of the
													// selection into the search
													// box
			$("#searchField_meat3").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#meat3_div').show();
			$('#searchField_meat3').val("");
			return;
		}
	});

	$('#meatnum3').change(function() {
		numberchange(this.value, 'meat', '3', meat_select3);
	});

	$("#searchField_meat4").autocomplete({
		target : $('#suggestions_meat4'),
		source : meat_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < meat_data.length; j++) {
				if ($a.text() == meat_data[j].name) {
					meat_select4[0] = meat_data[j].id;
					meat_select4[1] = meat_data[j].name;
					meat_select4[2] = meat_data[j].energy;
					meat_select4[3] = meat_data[j].protein;
					meat_select4[4] = meat_data[j].fat;
					meat_select4[5] = meat_data[j].carbohydrate;
					meat_select4[6] = meat_data[j].cellulose;
					meat_select4[7] = meat_data[j].calcium;
					meat_select4[8] = meat_data[j].ferrum;
					meat_select4[9] = meat_data[j].zinc;
					meat_select4[10] = meat_data[j].carotene;
					typechange('meat', '4', meat_select4);
				}
			}
			$('#searchField_meat4').val($a.text()); // place the value of the
													// selection into the search
													// box
			$("#searchField_meat4").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#meat4_div').show();
			$('#searchField_meat4').val("");
			return;
		}
	});

	$('#meatnum4').change(function() {
		numberchange(this.value, 'meat', '4', meat_select4);
	});

	$("#searchField_meat5").autocomplete({
		target : $('#suggestions_meat5'),
		source : meat_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < meat_data.length; j++) {
				if ($a.text() == meat_data[j].name) {
					meat_select5[0] = meat_data[j].id;
					meat_select5[1] = meat_data[j].name;
					meat_select5[2] = meat_data[j].energy;
					meat_select5[3] = meat_data[j].protein;
					meat_select5[4] = meat_data[j].fat;
					meat_select5[5] = meat_data[j].carbohydrate;
					meat_select5[6] = meat_data[j].cellulose;
					meat_select5[7] = meat_data[j].calcium;
					meat_select5[8] = meat_data[j].ferrum;
					meat_select5[9] = meat_data[j].zinc;
					meat_select5[10] = meat_data[j].carotene;
					typechange('meat', '5', meat_select5);
				}
			}
			$('#searchField_meat5').val($a.text()); // place the value of the
													// selection into the search
													// box
			$("#searchField_meat5").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#meat5_div').show();
			$('#searchField_meat5').val("");
			return;
		}
	});

	$('#meatnum5').change(function() {
		numberchange(this.value, 'meat', '5', meat_select5);
	});

	$("#searchField_vegetables1").autocomplete({
		target : $('#suggestions_vegetables1'),
		source : vegetables_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < vegetables_data.length; j++) {
				if ($a.text() == vegetables_data[j].name) {
					vegetables_select1[0] = vegetables_data[j].id;
					vegetables_select1[1] = vegetables_data[j].name;
					vegetables_select1[2] = vegetables_data[j].energy;
					vegetables_select1[3] = vegetables_data[j].protein;
					vegetables_select1[4] = vegetables_data[j].fat;
					vegetables_select1[5] = vegetables_data[j].carbohydrate;
					vegetables_select1[6] = vegetables_data[j].cellulose;
					vegetables_select1[7] = vegetables_data[j].calcium;
					vegetables_select1[8] = vegetables_data[j].ferrum;
					vegetables_select1[9] = vegetables_data[j].zinc;
					vegetables_select1[10] = vegetables_data[j].carotene;
					typechange('vegetables', '1', vegetables_select1);
				}
			}
			$('#searchField_vegetables1').val($a.text()); // place the value
															// of the selection
															// into the search
															// box
			$("#searchField_vegetables1").autocomplete('clear'); // clear the
																	// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#vegetables1_div').show();
			$('#searchField_vegetables1').val("");
			return;
		}
	});

	$('#vegetablesnum1').change(function() {
		numberchange(this.value, 'vegetables', '1', vegetables_select1);
	});

	$("#searchField_vegetables2").autocomplete({
		target : $('#suggestions_vegetables2'),
		source : vegetables_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < vegetables_data.length; j++) {
				if ($a.text() == vegetables_data[j].name) {
					vegetables_select2[0] = vegetables_data[j].id;
					vegetables_select2[1] = vegetables_data[j].name;
					vegetables_select2[2] = vegetables_data[j].energy;
					vegetables_select2[3] = vegetables_data[j].protein;
					vegetables_select2[4] = vegetables_data[j].fat;
					vegetables_select2[5] = vegetables_data[j].carbohydrate;
					vegetables_select2[6] = vegetables_data[j].cellulose;
					vegetables_select2[7] = vegetables_data[j].calcium;
					vegetables_select2[8] = vegetables_data[j].ferrum;
					vegetables_select2[9] = vegetables_data[j].zinc;
					vegetables_select2[10] = vegetables_data[j].carotene;
					typechange('vegetables', '2', vegetables_select2);
				}
			}
			$('#searchField_vegetables2').val($a.text()); // place the value
															// of the selection
															// into the search
															// box
			$("#searchField_vegetables2").autocomplete('clear'); // clear the
																	// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#vegetables2_div').show();
			$('#searchField_vegetables2').val("");
			return;
		}
	});

	$('#vegetablesnum2').change(function() {
		numberchange(this.value, 'vegetables', '2', vegetables_select2);
	});

	$("#searchField_vegetables3").autocomplete({
		target : $('#suggestions_vegetables3'),
		source : vegetables_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < vegetables_data.length; j++) {
				if ($a.text() == vegetables_data[j].name) {
					vegetables_select3[0] = vegetables_data[j].id;
					vegetables_select3[1] = vegetables_data[j].name;
					vegetables_select3[2] = vegetables_data[j].energy;
					vegetables_select3[3] = vegetables_data[j].protein;
					vegetables_select3[4] = vegetables_data[j].fat;
					vegetables_select3[5] = vegetables_data[j].carbohydrate;
					vegetables_select3[6] = vegetables_data[j].cellulose;
					vegetables_select3[7] = vegetables_data[j].calcium;
					vegetables_select3[8] = vegetables_data[j].ferrum;
					vegetables_select3[9] = vegetables_data[j].zinc;
					vegetables_select3[10] = vegetables_data[j].carotene;
					typechange('vegetables', '3', vegetables_select3);
				}
			}
			$('#searchField_vegetables3').val($a.text()); // place the value
															// of the selection
															// into the search
															// box
			$("#searchField_vegetables3").autocomplete('clear'); // clear the
																	// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#vegetables3_div').show();
			$('#searchField_vegetables3').val("");
			return;
		}
	});

	$('#vegetablesnum3').change(function() {
		numberchange(this.value, 'vegetables', '3', vegetables_select3);
	});

	$("#searchField_vegetables4").autocomplete({
		target : $('#suggestions_vegetables4'),
		source : vegetables_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < vegetables_data.length; j++) {
				if ($a.text() == vegetables_data[j].name) {
					vegetables_select4[0] = vegetables_data[j].id;
					vegetables_select4[1] = vegetables_data[j].name;
					vegetables_select4[2] = vegetables_data[j].energy;
					vegetables_select4[3] = vegetables_data[j].protein;
					vegetables_select4[4] = vegetables_data[j].fat;
					vegetables_select4[5] = vegetables_data[j].carbohydrate;
					vegetables_select4[6] = vegetables_data[j].cellulose;
					vegetables_select4[7] = vegetables_data[j].calcium;
					vegetables_select4[8] = vegetables_data[j].ferrum;
					vegetables_select4[9] = vegetables_data[j].zinc;
					vegetables_select4[10] = vegetables_data[j].carotene;
					typechange('vegetables', '4', vegetables_select4);
				}
			}
			$('#searchField_vegetables4').val($a.text()); // place the value
															// of the selection
															// into the search
															// box
			$("#searchField_vegetables4").autocomplete('clear'); // clear the
																	// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#vegetables4_div').show();
			$('#searchField_vegetables4').val("");
			return;
		}
	});

	$('#vegetablesnum4').change(function() {
		numberchange(this.value, 'vegetables', '4', vegetables_select4);
	});

	$("#searchField_vegetables5").autocomplete({
		target : $('#suggestions_vegetables5'),
		source : vegetables_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < vegetables_data.length; j++) {
				if ($a.text() == vegetables_data[j].name) {
					vegetables_select5[0] = vegetables_data[j].id;
					vegetables_select5[1] = vegetables_data[j].name;
					vegetables_select5[2] = vegetables_data[j].energy;
					vegetables_select5[3] = vegetables_data[j].protein;
					vegetables_select5[4] = vegetables_data[j].fat;
					vegetables_select5[5] = vegetables_data[j].carbohydrate;
					vegetables_select5[6] = vegetables_data[j].cellulose;
					vegetables_select5[7] = vegetables_data[j].calcium;
					vegetables_select5[8] = vegetables_data[j].ferrum;
					vegetables_select5[9] = vegetables_data[j].zinc;
					vegetables_select5[10] = vegetables_data[j].carotene;
					typechange('vegetables', '5', vegetables_select5);
				}
			}
			$('#searchField_vegetables5').val($a.text()); // place the value
															// of the selection
															// into the search
															// box
			$("#searchField_vegetables5").autocomplete('clear'); // clear the
																	// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#vegetables5_div').show();
			$('#searchField_vegetables5').val("");
			return;
		}
	});

	$('#vegetablesnum5').change(function() {
		numberchange(this.value, 'vegetables', '5', vegetables_select5);
	});

	$("#searchField_vegetables6").autocomplete({
		target : $('#suggestions_vegetables6'),
		source : vegetables_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < vegetables_data.length; j++) {
				if ($a.text() == vegetables_data[j].name) {
					vegetables_select6[0] = vegetables_data[j].id;
					vegetables_select6[1] = vegetables_data[j].name;
					vegetables_select6[2] = vegetables_data[j].energy;
					vegetables_select6[3] = vegetables_data[j].protein;
					vegetables_select6[4] = vegetables_data[j].fat;
					vegetables_select6[5] = vegetables_data[j].carbohydrate;
					vegetables_select6[6] = vegetables_data[j].cellulose;
					vegetables_select6[7] = vegetables_data[j].calcium;
					vegetables_select6[8] = vegetables_data[j].ferrum;
					vegetables_select6[9] = vegetables_data[j].zinc;
					vegetables_select6[10] = vegetables_data[j].carotene;
					typechange('vegetables', '6', vegetables_select6);
				}
			}
			$('#searchField_vegetables6').val($a.text()); // place the value
															// of the selection
															// into the search
															// box
			$("#searchField_vegetables6").autocomplete('clear'); // clear the
																	// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#vegetables6_div').show();
			$('#searchField_vegetables6').val("");
			return;
		}
	});

	$('#vegetablesnum6').change(function() {
		numberchange(this.value, 'vegetables', '6', vegetables_select6);
	});

	$("#searchField_vegetables7").autocomplete({
		target : $('#suggestions_vegetables7'),
		source : vegetables_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < vegetables_data.length; j++) {
				if ($a.text() == vegetables_data[j].name) {
					vegetables_select7[0] = vegetables_data[j].id;
					vegetables_select7[1] = vegetables_data[j].name;
					vegetables_select7[2] = vegetables_data[j].energy;
					vegetables_select7[3] = vegetables_data[j].protein;
					vegetables_select7[4] = vegetables_data[j].fat;
					vegetables_select7[5] = vegetables_data[j].carbohydrate;
					vegetables_select7[6] = vegetables_data[j].cellulose;
					vegetables_select7[7] = vegetables_data[j].calcium;
					vegetables_select7[8] = vegetables_data[j].ferrum;
					vegetables_select7[9] = vegetables_data[j].zinc;
					vegetables_select7[10] = vegetables_data[j].carotene;
					typechange('vegetables', '7', vegetables_select7);
				}
			}
			$('#searchField_vegetables7').val($a.text()); // place the value
															// of the selection
															// into the search
															// box
			$("#searchField_vegetables7").autocomplete('clear'); // clear the
																	// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#vegetables7_div').show();
			$('#searchField_vegetables7').val("");
			return;
		}
	});

	$('#vegetablesnum7').change(function() {
		numberchange(this.value, 'vegetables', '7', vegetables_select7);
	});

	$("#searchField_vegetables8").autocomplete({
		target : $('#suggestions_vegetables8'),
		source : vegetables_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < vegetables_data.length; j++) {
				if ($a.text() == vegetables_data[j].name) {
					vegetables_select8[0] = vegetables_data[j].id;
					vegetables_select8[1] = vegetables_data[j].name;
					vegetables_select8[2] = vegetables_data[j].energy;
					vegetables_select8[3] = vegetables_data[j].protein;
					vegetables_select8[4] = vegetables_data[j].fat;
					vegetables_select8[5] = vegetables_data[j].carbohydrate;
					vegetables_select8[6] = vegetables_data[j].cellulose;
					vegetables_select8[7] = vegetables_data[j].calcium;
					vegetables_select8[8] = vegetables_data[j].ferrum;
					vegetables_select8[9] = vegetables_data[j].zinc;
					vegetables_select8[10] = vegetables_data[j].carotene;
					typechange('vegetables', '8', vegetables_select8);
				}
			}
			$('#searchField_vegetables8').val($a.text()); // place the value
															// of the selection
															// into the search
															// box
			$("#searchField_vegetables8").autocomplete('clear'); // clear the
																	// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#vegetables8_div').show();
			$('#searchField_vegetables8').val("");
			return;
		}
	});

	$('#vegetablesnum8').change(function() {
		numberchange(this.value, 'vegetables', '8', vegetables_select8);
	});

	$("#searchField_vegetables9").autocomplete({
		target : $('#suggestions_vegetables9'),
		source : vegetables_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < vegetables_data.length; j++) {
				if ($a.text() == vegetables_data[j].name) {
					vegetables_select9[0] = vegetables_data[j].id;
					vegetables_select9[1] = vegetables_data[j].name;
					vegetables_select9[2] = vegetables_data[j].energy;
					vegetables_select9[3] = vegetables_data[j].protein;
					vegetables_select9[4] = vegetables_data[j].fat;
					vegetables_select9[5] = vegetables_data[j].carbohydrate;
					vegetables_select9[6] = vegetables_data[j].cellulose;
					vegetables_select9[7] = vegetables_data[j].calcium;
					vegetables_select9[8] = vegetables_data[j].ferrum;
					vegetables_select9[9] = vegetables_data[j].zinc;
					vegetables_select9[10] = vegetables_data[j].carotene;
					typechange('vegetables', '9', vegetables_select9);
				}
			}
			$('#searchField_vegetables9').val($a.text()); // place the value
															// of the selection
															// into the search
															// box
			$("#searchField_vegetables9").autocomplete('clear'); // clear the
																	// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#vegetables9_div').show();
			$('#searchField_vegetables9').val("");
			return;
		}
	});

	$('#vegetablesnum9').change(function() {
		numberchange(this.value, 'vegetables', '9', vegetables_select9);
	});

	$("#searchField_vegetables10").autocomplete({
		target : $('#suggestions_vegetables10'),
		source : vegetables_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < vegetables_data.length; j++) {
				if ($a.text() == vegetables_data[j].name) {
					vegetables_select10[0] = vegetables_data[j].id;
					vegetables_select10[1] = vegetables_data[j].name;
					vegetables_select10[2] = vegetables_data[j].energy;
					vegetables_select10[3] = vegetables_data[j].protein;
					vegetables_select10[4] = vegetables_data[j].fat;
					vegetables_select10[5] = vegetables_data[j].carbohydrate;
					vegetables_select10[6] = vegetables_data[j].cellulose;
					vegetables_select10[7] = vegetables_data[j].calcium;
					vegetables_select10[8] = vegetables_data[j].ferrum;
					vegetables_select10[9] = vegetables_data[j].zinc;
					vegetables_select10[10] = vegetables_data[j].carotene;
					typechange('vegetables', '10', vegetables_select10);
				}
			}
			$('#searchField_vegetables10').val($a.text()); // place the value
															// of the selection
															// into the search
															// box
			$("#searchField_vegetables10").autocomplete('clear'); // clear the
																	// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#vegetables10_div').show();
			$('#searchField_vegetables10').val("");
			return;
		}
	});

	$('#vegetablesnum10').change(function() {
		numberchange(this.value, 'vegetables', '10', vegetables_select10);
	});

	$("#searchField_drink1").autocomplete({
		target : $('#suggestions_drink1'),
		source : drink_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < drink_data.length; j++) {
				if ($a.text() == drink_data[j].name) {
					drink_select1[0] = drink_data[j].id;
					drink_select1[1] = drink_data[j].name;
					drink_select1[2] = drink_data[j].energy;
					drink_select1[3] = drink_data[j].protein;
					drink_select1[4] = drink_data[j].fat;
					drink_select1[5] = drink_data[j].carbohydrate;
					drink_select1[6] = drink_data[j].cellulose;
					drink_select1[7] = drink_data[j].calcium;
					drink_select1[8] = drink_data[j].ferrum;
					drink_select1[9] = drink_data[j].zinc;
					drink_select1[10] = drink_data[j].carotene;
					typechange('drink', '1', drink_select1);
				}
			}
			$('#searchField_drink1').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_drink1").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#drink1_div').show();
			$('#searchField_drink1').val("");
			return;
		}
	});

	$('#drinknum1').change(function() {
		numberchange(this.value, 'drink', '1', drink_select1);
	});

	$("#searchField_drink2").autocomplete({
		target : $('#suggestions_drink2'),
		source : drink_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < drink_data.length; j++) {
				if ($a.text() == drink_data[j].name) {
					drink_select2[0] = drink_data[j].id;
					drink_select2[1] = drink_data[j].name;
					drink_select2[2] = drink_data[j].energy;
					drink_select2[3] = drink_data[j].protein;
					drink_select2[4] = drink_data[j].fat;
					drink_select2[5] = drink_data[j].carbohydrate;
					drink_select2[6] = drink_data[j].cellulose;
					drink_select2[7] = drink_data[j].calcium;
					drink_select2[8] = drink_data[j].ferrum;
					drink_select2[9] = drink_data[j].zinc;
					drink_select2[10] = drink_data[j].carotene;
					typechange('drink', '2', drink_select2);
				}
			}
			$('#searchField_drink2').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_drink2").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#drink2_div').show();
			$('#searchField_drink2').val("");
			return;
		}
	});

	$('#drinknum2').change(function() {
		numberchange(this.value, 'drink', '2', drink_select2);
	});

	$("#searchField_drink3").autocomplete({
		target : $('#suggestions_drink3'),
		source : drink_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < drink_data.length; j++) {
				if ($a.text() == drink_data[j].name) {
					drink_select3[0] = drink_data[j].id;
					drink_select3[1] = drink_data[j].name;
					drink_select3[2] = drink_data[j].energy;
					drink_select3[3] = drink_data[j].protein;
					drink_select3[4] = drink_data[j].fat;
					drink_select3[5] = drink_data[j].carbohydrate;
					drink_select3[6] = drink_data[j].cellulose;
					drink_select3[7] = drink_data[j].calcium;
					drink_select3[8] = drink_data[j].ferrum;
					drink_select3[9] = drink_data[j].zinc;
					drink_select3[10] = drink_data[j].carotene;
					typechange('drink', '3', drink_select3);
				}
			}
			$('#searchField_drink3').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_drink3").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#drink3_div').show();
			$('#searchField_drink3').val("");
			return;
		}
	});

	$('#drinknum3').change(function() {
		numberchange(this.value, 'drink', '3', drink_select3);
	});

	$("#searchField_drink4").autocomplete({
		target : $('#suggestions_drink4'),
		source : drink_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < drink_data.length; j++) {
				if ($a.text() == drink_data[j].name) {
					drink_select4[0] = drink_data[j].id;
					drink_select4[1] = drink_data[j].name;
					drink_select4[2] = drink_data[j].energy;
					drink_select4[3] = drink_data[j].protein;
					drink_select4[4] = drink_data[j].fat;
					drink_select4[5] = drink_data[j].carbohydrate;
					drink_select4[6] = drink_data[j].cellulose;
					drink_select4[7] = drink_data[j].calcium;
					drink_select4[8] = drink_data[j].ferrum;
					drink_select4[9] = drink_data[j].zinc;
					drink_select4[10] = drink_data[j].carotene;
					typechange('drink', '4', drink_select4);
				}
			}
			$('#searchField_drink4').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_drink4").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#drink4_div').show();
			$('#searchField_drink4').val("");
			return;
		}
	});

	$('#drinknum4').change(function() {
		numberchange(this.value, 'drink', '4', drink_select4);
	});

	$("#searchField_drink5").autocomplete({
		target : $('#suggestions_drink5'),
		source : drink_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < drink_data.length; j++) {
				if ($a.text() == drink_data[j].name) {
					drink_select5[0] = drink_data[j].id;
					drink_select5[1] = drink_data[j].name;
					drink_select5[2] = drink_data[j].energy;
					drink_select5[3] = drink_data[j].protein;
					drink_select5[4] = drink_data[j].fat;
					drink_select5[5] = drink_data[j].carbohydrate;
					drink_select5[6] = drink_data[j].cellulose;
					drink_select5[7] = drink_data[j].calcium;
					drink_select5[8] = drink_data[j].ferrum;
					drink_select5[9] = drink_data[j].zinc;
					drink_select5[10] = drink_data[j].carotene;
					typechange('drink', '5', drink_select5);
				}
			}
			$('#searchField_drink5').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_drink5").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#drink5_div').show();
			$('#searchField_drink5').val("");
			return;
		}
	});

	$('#drinknum5').change(function() {
		numberchange(this.value, 'drink', '5', drink_select5);
	});

	$("#searchField_nut1").autocomplete({
		target : $('#suggestions_nut1'),
		source : nut_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < nut_data.length; j++) {
				if ($a.text() == nut_data[j].name) {
					nut_select1[0] = nut_data[j].id;
					nut_select1[1] = nut_data[j].name;
					nut_select1[2] = nut_data[j].energy;
					nut_select1[3] = nut_data[j].protein;
					nut_select1[4] = nut_data[j].fat;
					nut_select1[5] = nut_data[j].carbohydrate;
					nut_select1[6] = nut_data[j].cellulose;
					nut_select1[7] = nut_data[j].calcium;
					nut_select1[8] = nut_data[j].ferrum;
					nut_select1[9] = nut_data[j].zinc;
					nut_select1[10] = nut_data[j].carotene;
					typechange('nut', '1', nut_select1);
				}
			}
			$('#searchField_nut1').val($a.text()); // place the value of the
													// selection into the search
													// box
			$("#searchField_nut1").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#nut1_div').show();
			$('#searchField_nut1').val("");
			return;
		}
	});

	$('#nutnum1').change(function() {
		numberchange(this.value, 'nut', '1', nut_select1);
	});

	$("#searchField_nut2").autocomplete({
		target : $('#suggestions_nut2'),
		source : nut_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < nut_data.length; j++) {
				if ($a.text() == nut_data[j].name) {
					nut_select2[0] = nut_data[j].id;
					nut_select2[1] = nut_data[j].name;
					nut_select2[2] = nut_data[j].energy;
					nut_select2[3] = nut_data[j].protein;
					nut_select2[4] = nut_data[j].fat;
					nut_select2[5] = nut_data[j].carbohydrate;
					nut_select2[6] = nut_data[j].cellulose;
					nut_select2[7] = nut_data[j].calcium;
					nut_select2[8] = nut_data[j].ferrum;
					nut_select2[9] = nut_data[j].zinc;
					nut_select2[10] = nut_data[j].carotene;
					typechange('nut', '2', nut_select2);
				}
			}
			$('#searchField_nut2').val($a.text()); // place the value of the
													// selection into the search
													// box
			$("#searchField_nut2").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#nut2_div').show();
			$('#searchField_nut2').val("");
			return;
		}
	});

	$('#nutnum2').change(function() {
		numberchange(this.value, 'nut', '2', nut_select2);
	});

	$("#searchField_nut3").autocomplete({
		target : $('#suggestions_nut3'),
		source : nut_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < nut_data.length; j++) {
				if ($a.text() == nut_data[j].name) {
					nut_select3[0] = nut_data[j].id;
					nut_select3[1] = nut_data[j].name;
					nut_select3[2] = nut_data[j].energy;
					nut_select3[3] = nut_data[j].protein;
					nut_select3[4] = nut_data[j].fat;
					nut_select3[5] = nut_data[j].carbohydrate;
					nut_select3[6] = nut_data[j].cellulose;
					nut_select3[7] = nut_data[j].calcium;
					nut_select3[8] = nut_data[j].ferrum;
					nut_select3[9] = nut_data[j].zinc;
					nut_select3[10] = nut_data[j].carotene;
					typechange('nut', '3', nut_select3);
				}
			}
			$('#searchField_nut3').val($a.text()); // place the value of the
													// selection into the search
													// box
			$("#searchField_nut3").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#nut3_div').show();
			$('#searchField_nut3').val("");
			return;
		}
	});

	$('#nutnum3').change(function() {
		numberchange(this.value, 'nut', '3', nut_select3);
	});

	$("#searchField_nut4").autocomplete({
		target : $('#suggestions_nut4'),
		source : nut_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < nut_data.length; j++) {
				if ($a.text() == nut_data[j].name) {
					nut_select4[0] = nut_data[j].id;
					nut_select4[1] = nut_data[j].name;
					nut_select4[2] = nut_data[j].energy;
					nut_select4[3] = nut_data[j].protein;
					nut_select4[4] = nut_data[j].fat;
					nut_select4[5] = nut_data[j].carbohydrate;
					nut_select4[6] = nut_data[j].cellulose;
					nut_select4[7] = nut_data[j].calcium;
					nut_select4[8] = nut_data[j].ferrum;
					nut_select4[9] = nut_data[j].zinc;
					nut_select4[10] = nut_data[j].carotene;
					typechange('nut', '4', nut_select4);
				}
			}
			$('#searchField_nut4').val($a.text()); // place the value of the
													// selection into the search
													// box
			$("#searchField_nut4").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#nut4_div').show();
			$('#searchField_nut4').val("");
			return;
		}
	});

	$('#nutnum4').change(function() {
		numberchange(this.value, 'nut', '4', nut_select4);
	});

	$("#searchField_nut5").autocomplete({
		target : $('#suggestions_nut5'),
		source : nut_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < nut_data.length; j++) {
				if ($a.text() == nut_data[j].name) {
					nut_select5[0] = nut_data[j].id;
					nut_select5[1] = nut_data[j].name;
					nut_select5[2] = nut_data[j].energy;
					nut_select5[3] = nut_data[j].protein;
					nut_select5[4] = nut_data[j].fat;
					nut_select5[5] = nut_data[j].carbohydrate;
					nut_select5[6] = nut_data[j].cellulose;
					nut_select5[7] = nut_data[j].calcium;
					nut_select5[8] = nut_data[j].ferrum;
					nut_select5[9] = nut_data[j].zinc;
					nut_select5[10] = nut_data[j].carotene;
					typechange('nut', '5', nut_select5);
				}
			}
			$('#searchField_nut5').val($a.text()); // place the value of the
													// selection into the search
													// box
			$("#searchField_nut5").autocomplete('clear'); // clear the
															// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#nut5_div').show();
			$('#searchField_nut5').val("");
			return;
		}
	});

	$('#nutnum5').change(function() {
		numberchange(this.value, 'nut', '5', nut_select5);
	});

	$("#searchField_fruits1").autocomplete({
		target : $('#suggestions_fruits1'),
		source : fruits_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < fruits_data.length; j++) {
				if ($a.text() == fruits_data[j].name) {
					fruits_select1[0] = fruits_data[j].id;
					fruits_select1[1] = fruits_data[j].name;
					fruits_select1[2] = fruits_data[j].energy;
					fruits_select1[3] = fruits_data[j].protein;
					fruits_select1[4] = fruits_data[j].fat;
					fruits_select1[5] = fruits_data[j].carbohydrate;
					fruits_select1[6] = fruits_data[j].cellulose;
					fruits_select1[7] = fruits_data[j].calcium;
					fruits_select1[8] = fruits_data[j].ferrum;
					fruits_select1[9] = fruits_data[j].zinc;
					fruits_select1[10] = fruits_data[j].carotene;
					typechange('fruits', '1', fruits_select1);
				}
			}
			$('#searchField_fruits1').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_fruits1").autocomplete('clear'); // clear the
																// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#fruits1_div').show();
			$('#searchField_fruits1').val("");
			return;
		}
	});

	$('#fruitsnum1').change(function() {
		numberchange(this.value, 'fruits', '1', fruits_select1);
	});

	$("#searchField_fruits2").autocomplete({
		target : $('#suggestions_fruits2'),
		source : fruits_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < fruits_data.length; j++) {
				if ($a.text() == fruits_data[j].name) {
					fruits_select2[0] = fruits_data[j].id;
					fruits_select2[1] = fruits_data[j].name;
					fruits_select2[2] = fruits_data[j].energy;
					fruits_select2[3] = fruits_data[j].protein;
					fruits_select2[4] = fruits_data[j].fat;
					fruits_select2[5] = fruits_data[j].carbohydrate;
					fruits_select2[6] = fruits_data[j].cellulose;
					fruits_select2[7] = fruits_data[j].calcium;
					fruits_select2[8] = fruits_data[j].ferrum;
					fruits_select2[9] = fruits_data[j].zinc;
					fruits_select2[10] = fruits_data[j].carotene;
					typechange('fruits', '2', fruits_select2);
				}
			}
			$('#searchField_fruits2').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_fruits2").autocomplete('clear'); // clear the
																// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#fruits2_div').show();
			$('#searchField_fruits2').val("");
			return;
		}
	});

	$('#fruitsnum2').change(function() {
		numberchange(this.value, 'fruits', '2', fruits_select2);
	});

	$("#searchField_fruits3").autocomplete({
		target : $('#suggestions_fruits3'),
		source : fruits_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < fruits_data.length; j++) {
				if ($a.text() == fruits_data[j].name) {
					fruits_select3[0] = fruits_data[j].id;
					fruits_select3[1] = fruits_data[j].name;
					fruits_select3[2] = fruits_data[j].energy;
					fruits_select3[3] = fruits_data[j].protein;
					fruits_select3[4] = fruits_data[j].fat;
					fruits_select3[5] = fruits_data[j].carbohydrate;
					fruits_select3[6] = fruits_data[j].cellulose;
					fruits_select3[7] = fruits_data[j].calcium;
					fruits_select3[8] = fruits_data[j].ferrum;
					fruits_select3[9] = fruits_data[j].zinc;
					fruits_select3[10] = fruits_data[j].carotene;
					typechange('fruits', '3', fruits_select3);
				}
			}
			$('#searchField_fruits3').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_fruits3").autocomplete('clear'); // clear the
																// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#fruits3_div').show();
			$('#searchField_fruits3').val("");
			return;
		}
	});

	$('#fruitsnum3').change(function() {
		numberchange(this.value, 'fruits', '3', fruits_select3);
	});

	$("#searchField_fruits4").autocomplete({
		target : $('#suggestions_fruits4'),
		source : fruits_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < fruits_data.length; j++) {
				if ($a.text() == fruits_data[j].name) {
					fruits_select4[0] = fruits_data[j].id;
					fruits_select4[1] = fruits_data[j].name;
					fruits_select4[2] = fruits_data[j].energy;
					fruits_select4[3] = fruits_data[j].protein;
					fruits_select4[4] = fruits_data[j].fat;
					fruits_select4[5] = fruits_data[j].carbohydrate;
					fruits_select4[6] = fruits_data[j].cellulose;
					fruits_select4[7] = fruits_data[j].calcium;
					fruits_select4[8] = fruits_data[j].ferrum;
					fruits_select4[9] = fruits_data[j].zinc;
					fruits_select4[10] = fruits_data[j].carotene;
					typechange('fruits', '4', fruits_select4);
				}
			}
			$('#searchField_fruits4').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_fruits4").autocomplete('clear'); // clear the
																// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#fruits4_div').show();
			$('#searchField_fruits4').val("");
			return;
		}
	});

	$('#fruitsnum4').change(function() {
		numberchange(this.value, 'fruits', '4', fruits_select4);
	});

	$("#searchField_fruits5").autocomplete({
		target : $('#suggestions_fruits5'),
		source : fruits_data_name,
		callback : function(e) {
			var $a = $(e.currentTarget); // access the selected item
			for (j = 0; j < fruits_data.length; j++) {
				if ($a.text() == fruits_data[j].name) {
					fruits_select5[0] = fruits_data[j].id;
					fruits_select5[1] = fruits_data[j].name;
					fruits_select5[2] = fruits_data[j].energy;
					fruits_select5[3] = fruits_data[j].protein;
					fruits_select5[4] = fruits_data[j].fat;
					fruits_select5[5] = fruits_data[j].carbohydrate;
					fruits_select5[6] = fruits_data[j].cellulose;
					fruits_select5[7] = fruits_data[j].calcium;
					fruits_select5[8] = fruits_data[j].ferrum;
					fruits_select5[9] = fruits_data[j].zinc;
					fruits_select5[10] = fruits_data[j].carotene;
					typechange('fruits', '5', fruits_select5);
				}
			}
			$('#searchField_fruits5').val($a.text()); // place the value of
														// the selection into
														// the search box
			$("#searchField_fruits5").autocomplete('clear'); // clear the
																// listview
		},
		minLength : 1,
		matchFromStart : false,
		onNoResults : function() {
			$('#fruits5_div').show();
			$('#searchField_fruits5').val("");
			return;
		}
	});

	$('#fruitsnum5').change(function() {
		numberchange(this.value, 'fruits', '5', fruits_select5);
	});

});
