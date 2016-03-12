function coord=read_coord(st_add)
global elem;
global nnode;
global gam1;
display('read coord  <><><><><><><><><><><>');
tic;
%[][][][][][][][][][][][][][][][][][][][][][]
%................creat coord.................
coord=[];
st_add3=[st_add,'\node.txt'];
fid=fopen(st_add3);
st=fgetl(fid);
while(st~=-1)
    data=str2num(st);
    coord=[coord;data];
    st=fgetl(fid);
end
fclose(fid);
if(size(coord,2)==4)    coord(:,4)=[];  end
nnode=size(coord,1);
% for use in next programing.........
% node2user=coord(:,1);
% for use in next programing.........
gam1=coord(1,1)-1;    coord(:,1)=[];
elem(:,1:4)=elem(:,1:4)-gam1;

%............................................
%[][][][][][][][][][][][][][][][][][][][][][]
toc