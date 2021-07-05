var container;
var button1 = document.getElementById("btn");
var button1 = document.getElementById("btn2");
var check;

button1.addEventListener("click",function(){
	var request = new XMLHttpRequest();
	request.open("GET","Utenti.jsp","true");
	container = document.getElementById("result1");
	check = document.getElementById("ID");
	request.onload = function(){
		var data = JSON.parse(request.responseText);
		renderHTML(data,check);
	};
	request.send();
});

button2.addEventListener("click",function(){
	var request = new XMLHttpRequest();
	request.open("GET")
	container = document.getElementById("result2");
	check = document.getElementById("EMAIL");
	request.onload = function(){
		var data = JSON.parse(request.responseText);
		renderHTML(data,check);
	};
	request.send();
});

function renderHTML(data,check){
	result = "Il campo è disponibile";
	for( i = 0; i<data.length; i++)
		{
			if(data[i] == check) reult = "Il campo non è disponibile";
		}
	container.insertAdjacentHTML("beforeend", result);
}