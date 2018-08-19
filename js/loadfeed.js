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
