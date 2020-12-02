pico-8 cartridge // http://www.pico-8.com
version 29
__lua__



pal={5,13,6,7,7}

function _draw()

	cls();

	local time=time()*0.2;
	local v=0;



	local scale=1;

	for xx=1,128,2 do
	for yy=1,128,2 do

		local x=xx/128.0-64+time;
		local y=yy/128.0-64+time;
		local cx=0;
		local cy=0;

		v=0;

	    v += sin((x+time));
	    v += sin((y+time)/2.0);
	    v += sin((x+y+time)/2.0);
	    cx += scale*sin(time/2.0);
	    cy += scale*cos(time/2.0);

	    --v += sin((cx+cy+1.0)+time);

	    v = sin(v*1.5+1.0)*6;
	    --v = v+1.0*3;

		pset(xx,yy,pal[flr(v)]);
		pset(xx+1,yy+1,pal[flr(v)]);
		pset(xx,yy+1,pal[flr(v)]);
		pset(xx+1,yy,pal[flr(v)]);


	end
	end

print(stat(1),0,0,7);

end





__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000