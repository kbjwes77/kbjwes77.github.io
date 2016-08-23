-- requires
require("player");
require("map");
class = require("30log");

--CREATE EVENT--
function love.load()
	target_fps = 1/60;
	next_time = love.timer.getTime();
	
	-- view
	view = {w=0; h=0};
	view.w, view.h = love.graphics.getDimensions();
	
	-- mouse position
	mouse = {x=0; y=0; click=0};
	
	-- keyboard
	key = {left=0; right=0; up=0};
	
	-- sprites
	spr_alien = love.graphics.newImage("/art/alien.png");
	
	-- player
	player.init(view.w/2,view.h/2);
	
	-- bullet
	bullets = {};
	bullet = class("bullet",{x=0; y=0; xspeed=0; yspeed=0; dir=0});
	
	-- boundaries
	bound = {x1=0; y1=0; x2=view.w-player.w; y2=view.h-player.h};
	
	-- map
	tile = {w=16; h=16};
	tiles = {};
	
	map.w = math.floor(view.w/16)
	map.h = math.floor(view.h/16);
	
	map.gen = function()
		map.fill(0);
		
		for xx=0, map.w, 1 do
			tiles[xx*map.w + (map.h-1)] = 1;
		end
		
		for xx=0, map.w-1, 1 do
			for yy=map.h-2, math.floor(map.h/2), -1 do
				if ((love.math.random()) < 0.2) then
					tiles[xx*map.w + yy] = 1;
				else
					tiles[xx*map.w + yy] = 0;
				end
			end
		end
	end
	
	map.gen();
end

--STEP EVENT--
function love.update(dt)
	next_time = next_time + target_fps;
	
	-- update mouse position
	mouse.x, mouse.y = love.mouse.getPosition();
	
	if (love.mouse.isDown(1)) and not(mouse.l) then
		map.toggle(math.floor(mouse.x/tile.w),math.floor(mouse.y/tile.h));
		mouse.l = true;
	end
	
	if not(love.mouse.isDown(1)) then
		mouse.l = false;
	end
	
	-- update keyboard input
	key.left  = love.keyboard.isDown("a");
	key.right = love.keyboard.isDown("d");
	key.up    = love.keyboard.isDown("w");
	key.reset = love.keyboard.isDown("r");
	
	if (key.reset) then
		player.init(view.w/2,view.h/2 - 64);
		
		map.gen();
	end
	
	player.move();
end

--DRAW EVENT--
function love.draw()
	local cur_time = love.timer.getTime();
	if (next_time <= cur_time) then
		next_time = cur_time;
		return
	end
	
	for xx=0, map.w, 1 do
		for yy=0, map.h, 1 do
			if (tiles[xx*map.w + yy] == 1) then
				love.graphics.rectangle("fill",xx*tile.w,yy*tile.h,tile.w,tile.h);
			end
		end
	end
	
	love.graphics.setColor(0,255,0,255);
	love.graphics.rectangle("line",player.x,player.y,player.w,player.h);
	love.graphics.setColor(255,255,255,255);
	
	love.graphics.draw(spr_alien,player.x,player.y-7);
	
	love.timer.sleep(next_time - cur_time);
end