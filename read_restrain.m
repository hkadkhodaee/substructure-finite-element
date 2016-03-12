function read_restrain(st_add,read_mode)
global nnode;
global gam1;
global restrain;
%global gam2;
display('read restrain   <><><><><><><><><><><>')
tic;
%[][][][][][][][][][][][][][][][][][][][][][]
%...............creat elem...................
st_add2=[st_add,'\restrain.txt'];
fid=fopen(st_add2);
st=fgetl(fid);
while(st~=-1)
    data=str2num(st)-gam1;
    restrain(data)=1;
    st=fgetl(fid);
end
fclose(fid);
end