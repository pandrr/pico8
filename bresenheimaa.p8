pico-8 cartridge // http://www.pico-8.com
version 27
__lua__


pal={5,13,6,7}
pali={7,6,13,5}
numCols=4;


-- void drawPixel( int x , int y , float brightness) 
-- { 
--     int c = 255*brightness; 
--     SDL_SetRenderDrawColor(pRenderer, c, c, c, 255); 
--     SDL_RenderDrawPoint(pRenderer, x, y); 
-- } 

function fPartOfNumber( x) 
	return x-flr(x);
end 
  
function rfPartOfNumber( x) 
    return 1 - (x-flr(x)); 
end 

function drawPixel(x,y,bright)

	if(bright>0) then
		pset(x,y,pali[flr(bright*numCols)+1]);
	else
		pset(x,y,pal[flr((abs(bright))*numCols)+1]); --kacke
	end

end

function myline(x0,y0,x1,y1)

    local steep = abs(y1 - y0) > abs(x1 - x0) ; 
  
    if (steep) then
    	local tmp=y0;
    	y0=x0;
    	x0=tmp;

    	tmp=y1;
    	y1=x1;
    	x1=tmp;
    end

    if (x0 > x1) 
    then
    	local tmp=x1;
    	x1=x0;
    	x0=tmp;

    	tmp=y1;
    	y1=y0;
    	y0=tmp;
    end 
  
    local dx = x1-x0; 
    local dy = y1-y0; 
    local gradient = dy/dx; 
    if (dx == 0.0) gradient = 1;
  
    local xpxl1 = x0; 
    local xpxl2 = x1; 
    local intersectY = y0; 
  
    if (steep) 
    then
        for x = xpxl1,xpxl2,1 do
            local flrInterY=flr(intersectY);
            drawPixel(flrInterY, x,  1 - (intersectY-flrInterY)); 
            drawPixel(flrInterY-1.0, x,  intersectY-flrInterY); 
            intersectY += gradient; 
        end 
    else
        for x = xpxl1,xpxl2,1
        do
            local flrInterY=flr(intersectY);
            drawPixel(x, flrInterY,  1 - (intersectY-flrInterY)); 
            drawPixel(x, flrInterY-1.0,  intersectY-flrInterY); 
            intersectY += gradient; 
        end 
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

	cls(0);
	local t=time()-last;


	local a=flr(xx-t*dx);
	local b=flr(yy-t*dy);
	local c=flr(xx2-t*dx2);
	local d=flr(yy2-t*dy2);

	-- myline(a,b,c,d);



	local deg2rad=17.453292519943295;
	local segs=8;
	local step=360/segs;
	local radius=0;
	local lx=0;
	local ly=0;

	camera(-64,-64);

local t=time();

	for j=1,10,1 do
		radius=(j*10+t*13.0) % 100.0;

		for i=0,segs-1,1 do

		    local degInRad = ((step*4 * i +j)* deg2rad/1000)+(t*0.08);
		    local posx =(sin(t*0.2)*(90-radius)*0.4) +cos(degInRad) * radius;
		    local posy = sin(degInRad) * radius;

			if(i ~= 0) then 
				myline(lx,ly,posx,posy);
			end

			lx=posx;
			ly=posy;
		end
	end





	if(time()-last>5)randomize();

end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
