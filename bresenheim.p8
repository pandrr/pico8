pico-8 cartridge // http://www.pico-8.com
version 27
__lua__

pal={5,13,6,7,7}


function myline(x0,y0,x1,y1)

	local dx =  abs(x1-x0);
	local sx = -1;
	local dy = -abs(y1-y0);
	local sy = -1;

	if y0 <= y1 then sy = 1; end
	if x0 <= x1 then sx = 1; end

	local err = dx+dy;
	local e2=0; 

	while 1 do

		local oldx=x0;
		local oldy=y0;

		pset(x0,y0,5);

		if x0==x1 and y0==y1 then break; end
		e2 = 2*err;
		if (e2 > dy) then
			err += dy; 
			x0 += sx;
		end
		if (e2 < dx) then 
			err += dx;
			y0 += sy;
		end

--		if flr(oldy) != flr(y0) then pset(oldx+1,oldy,4) end
	end
end

xx=0;
yy=0;
yy2=0;
xx2=0;

dx=rnd(3)
dy=rnd(3)
dx2=rnd(3)
dy2=rnd(3)

function randomize()
	xx=rnd(120)
	yy=rnd(120)
	yy2=rnd(120)
	xx2=rnd(120)

	local rmove=20;

	dx=rnd(rmove)-rmove/2;
	dy=rnd(rmove)-rmove/2;
	dx2=rnd(rmove)-rmove/2;
	dy2=rnd(rmove)-rmove/2;

	last=time()
end

last=-100

function _draw()

	cls();
	local t=time()-last;


	local a=flr(xx-t*dx);
	local b=flr(yy-t*dy);
	local c=flr(xx2-t*dx2);
	local d=flr(yy2-t*dy2);

	myline(a,b,c,d);

	print(tostr(xx).." "..tostr(yy).." "..tostr(xx2).." "..tostr(yy2),0,0);

	print(stat(1),0,120);

	pset(a,b,9);
	pset(c,d,10);

	if(time()-last>5)randomize();

end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
