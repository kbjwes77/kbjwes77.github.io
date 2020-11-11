// url query
const url_query = function(field)
	{
	let query = new URLSearchParams(window.location.search.substring(1));
	return query.get(field);
	};

// set header
const set_header = function() {
	let url  = new URL(window.location);
	let path = url.pathname.substring(1);
	
	let mode = "";
	if ((!mode) && (path.startsWith(`gamedev`))) mode = "gamedev";
	if ((!mode) && (path.startsWith(`music`)))   mode = "music";
	if ((!mode) && (path.startsWith(`art`)))     mode = "art";
	if ((!mode) && (path.startsWith(`contact`))) mode = "contact";
	if  (!mode)									 mode = "home";
	
	document.getElementById(`header`).innerHTML = `
		<div class="page-header">
			<h1>kbjwes77.github.io</h1>
			<ul class="nav nav-tabs">
				<li role="presentation" ${(mode == "home")    ? 'class="active"' : ''}><a href="${(mode == "home")    ? '#' : '/'}">       <span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
				<li role="presentation" ${(mode == "gamedev") ? 'class="active"' : ''}><a href="${(mode == "gamedev") ? '#' : '/gamedev'}"><span class="glyphicon glyphicon-knight" aria-hidden="true"></span></a></li>
				<li role="presentation" ${(mode == "music")   ? 'class="active"' : ''}><a href="${(mode == "music")   ? '#' : '/music'}">  <span class="glyphicon glyphicon-music" aria-hidden="true"></span></a></li>
				<li role="presentation" ${(mode == "art")     ? 'class="active"' : ''}><a href="${(mode == "art")     ? '#' : '/art'}">    <span class="glyphicon glyphicon-picture" aria-hidden="true"></span></a></li>
				<li role="presentation" ${(mode == "contact") ? 'class="active"' : ''}><a href="${(mode == "contact") ? '#' : '/contact'}"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></a></li>
			</ul>
		</div>`;
	}

// set footer
const set_footer = function() {
	document.getElementById(`footer`).innerHTML = `
		<footer>
			<p>&copy; kbjwes77 2020, made possible with: <a href="http://getbootstrap.com/">Bootstrap</a>, created by Twitter <a href="https://creativecommons.org/licenses/by/3.0/">(CC-BY)</a></p>
		</footer>`;
	}

// load template into element
const load_template = async function(file,element)
	{
	try {
		let html = await fetch(file);
		document.getElementById(element).innerHTML = html;
		}
	catch (error)
		{
		console.error(`Failed to load template '${file}' (${error})`);
		}
	};

// ======= INIT ======= //

window.onload = () => {
	set_header();
	set_footer();
	}