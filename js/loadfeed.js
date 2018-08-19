function loadfeed(feed_min,feed_max,feed_len,clamp)
	{
	var req;
	for (var i=0; i<feed_len; i++)
		{
		(function(feed_ind,post_div) // need function closure
			{
			if (feed_ind >= feed_min && feed_ind <= feed_max)
				{
				req = new XMLHttpRequest();
				req.open("GET","/feed/post" + feed_ind + "/post.html", true);
				req.onreadystatechange= function()
					{
					if (this.readyState!==4) return;
					if (this.status!==200) return;
					document.getElementById("post-" + post_div).innerHTML = this.responseText;
					
					if (clamp)
						{
						$clamp(document.getElementById("post-" + post_div + "-text"), {clamp: 3});
						}
					else
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
