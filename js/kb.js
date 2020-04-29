// query URL for fields
function urlQuery(field)
	{
	var query = window.location.search.substring(1);
	var vars = query.split("&");
	for (var i=0;i<vars.length;i++)
		{
		var pair = vars[i].split("=");
		if(pair[0] == field)
			{
			return(pair[1]);
			};
		};
	return("");
	};

// load a template into an element by ID
function loadTemplate(file,element)
	{
	if (element == "header")
		{
		switch(pageType)
			{
			case "home":
				file = "/templates/header-home.html";
				break;
			case "game":
				file = "/templates/header-game.html";
				break;
			case "music":
				file = "/templates/header-music.html";
				break;
			case "art":
				file = "/templates/header-art.html";
				break;
			case "contact":
				file = "/templates/header-contact.html";
				break;
			}
		}
	var req = new XMLHttpRequest();
	req.open("GET",file,true);
	req.onreadystatechange = function()
		{
		if (this.readyState!==4) return;
		if (this.status!==200) return;
		document.getElementById(element).innerHTML = this.responseText;
		};
	req.send();
	};