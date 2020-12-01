pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
cls();

mult=127/2

function project(p)
	local x=abs(p[3])<=0.1 and 0 or -mult*(p[1])/(p[3])+127/2
	local y=abs(p[3])<=0.1 and 0 or -mult*(p[2])/(p[3])+127/2
	return x,y
end

--[[
	rotate a point around itself
	(if c is given, rotates around it)

	p = point
	a = axis ("x", "y", "z") as a string
	r = how much to rotate
	c = center (nil if rotation is around the shape itself)

	return = nothing, changes point by reference
--]]
function rotate_point(p,a,r,c)
	if c then
	  p[1]-=c[1]
	  p[2]-=c[2]
	  p[3]-=c[3]
	end
	local x,y,z=1,2,3

	if 		a=="z" then x,y,z=1,2,3
	elseif 	a=="y" then x,y,z=3,1,2
	elseif 	a=="x" then x,y,z=2,3,1
	end
  -- figure out which axis we're rotating on
  local _x = cos(r)*(p[x]) - sin(r) * (p[y]) -- calculate the new x location
  local _y = sin(r)*(p[x]) + cos(r) * (p[y]) -- calculate the new y location

  p[x] = _x
  p[y] = _y
  p[z] = p[z]

  if c then
	  p[1]+=c[1]
	  p[2]+=c[2]
	  p[3]+=c[3]
  end
end



function _init()

print("demo!!");
end

arr={};
rots={};
for i=1,199 do
	arr[i]={
		(rnd(1000)-500)/1000,
		(rnd(1000)-500)/1000,
		(rnd(1000)-500)/1000
		};
	
	rots[i]={
		(rnd(1)-0.5)*0.015,
		(rnd(1)-0.5)*0.025,
		(rnd(1)-0.5)*0.015		
	};
	

end

print(arr[1]);
print("hurz");

function _draw()
cls();
color(3);
//line(0,0,time()*100%200,100);
local x,y=project({0.1,-0.4,0.5});
pset(x,y,3);

for i=1,count(arr) 
do
	local x1,y1=project(arr[i]);
//	pset(x,y,3);

 rotate_point(arr[i],	"x",rots[i][1]);
 rotate_point(arr[i],	"y",rots[i][2]);
 rotate_point(arr[i],	"z",rots[i][3]);
//	rotate_point(arr[i],"y",arr[i][2]*0.03);
	
	local x,y=project(arr[i]);
//	pset(x,y,11);
	
	if(x>0 and x1>0) then
		line(x1,y1,x,y,arr[i][2]*4+2);
	end
end
color(3);
print(stat(1),1,1);
print(rots[2][1],1,13);
end


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
