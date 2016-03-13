function read_force(st_add,read_mode)
global nnode;
global gam1;
global f;
%global gam2;
display('read force   <><><><><><><><><><><>')
tic;
%[][][][][][][][][][][][][][][][][][][][][][]
%...............read Force...................
st_add2=[st_add,'\force.txt'];
fid=fopen(st_add2);
st=fgetl(fid);
while(st~=-1)
    data=str2num(st);
    deg=data(1);
    force=data(2);
    f(deg)=force;
    st=fgetl(fid);
end
fclose(fid);
end