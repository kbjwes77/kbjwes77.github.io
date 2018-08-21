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

// load feed
function loadfeed(feed_min,feed_max,feed_len,shorten)
	{
	for (var i=0; i<feed_len; i++)
		{
		(function(feed_ind,post_div) // need function closure
			{
			if (feed_ind >= feed_min && feed_ind <= feed_max)
				{
				var req = new XMLHttpRequest();
				req.readmore = shorten;
				req.open("GET","/feed/post" + feed_ind + "/post.html", true);
				req.onreadystatechange = function()
					{
					if (this.readyState!==4) return;
					if (this.status!==200) return;
					document.getElementById("post-" + post_div).innerHTML = this.responseText;
					
					if (this.readmore) // !fulltext
						{
						$clamp(document.getElementById("post-" + feed_ind + "-text"), {clamp: 3});
						}
					else // fulltext
						{
						var element = document.getElementById("read-more-" + feed_ind);
						element.parentNode.removeChild(element);
						};
					};
				req.send();
				};
			})(feed_min+i,i+1) // closure so variables aren't changed inside the loop from outside (stupid ASYNC)
		};
	};

// load a template into an element by ID
function loadtemp(file,element)
	{
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