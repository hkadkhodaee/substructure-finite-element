function elem=read_elem(st_add)
global elem2user;
global nelem;
%global gam2;
display('read elem   <><><><><><><><><><><>')
tic;
%[][][][][][][][][][][][][][][][][][][][][][]
%...............creat elem...................
elem=[];
st_add2=[st_add,'\elem.txt'];
fid=fopen(st_add2);
st=fgetl(fid);
while(st~=-1)
    data=str2num(st);
    elem=[elem;data];
    st=fgetl(fid);
end
fclose(fid);
gam2=elem(1,1)-1;
% for use in next programing.........
elem2user=elem(:,1);
% for use in next programing.........
elem(:,6)=elem(:,1);
elem(:,1)=[];
% elem=elem-gam1;
nelem=size(elem,1);
%............................................
%[][][][][][][][][][][][][][][][][][][][][][]
toc