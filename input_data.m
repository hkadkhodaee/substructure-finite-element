function input_data(st_add)
global time;
global sub;     global subinfo;
global elem;    global coord;
global nsub;
global nnode;   global nelem;
global maxelem;
global gam1;    global gam2;
global node2user;   global elem2user;
clc
% st_add='input_data\data4';
dtrue1=true;
i=0;
nsub_region=[];
nsub=0;
tic
while(dtrue1)
    i=i+1;
    dtrue2=true;
    st_add1=[st_add,'\region',num2str(i)];
    id=exist(st_add1);
    if(id==7)
        j=1;
        while(dtrue2)
            st_add2=[st_add1,'\sub',num2str(j),'.txt'];
            id2=exist(st_add2);
            if(id2==2)
                j=j+1;
            else
                dtrue2=false;
                j=j-1;
            end
        end
        nsub=nsub+j;
        nsub_region=[nsub_region,j];
    else
      dtrue1=false;
      i=i-1;
    end
    n_region=i;
end

toc
c1=0;
sub=[];
% clc
tic
for i=1:n_region
    nsub0=nsub_region(i);
    
    for j=1:nsub0
        nsubelem=0;
        c1=c1+1;
        st_add1=[st_add,'\region',num2str(i),'\sub',num2str(j),'.txt'];
        fid=fopen(st_add1);
        st=1;
        while(st~=-1)
             st=fgetl(fid);
             if(st~=-1)
             data=str2num(st);
             nsubelem=nsubelem+1;
             sub(c1,nsubelem)=data(1);
             end
        end
        subinfo(c1,1)=nsubelem;
        fclose(fid);

    end
end
maxelem=max(subinfo(:,1));
fclose('all');
toc

tic;
elem=read_elem(st_add);
coord=read_coord(st_add);

% %[][][][][][][][][][][][][][][][][][][][][][]
% %...............creat elem...................
% elem=[];
% st_add2=[st_add,'\elem.txt'];
% fid=fopen(st_add2);
% st=fgetl(fid);
% while(st~=-1)
%     data=str2num(st);
%     elem=[elem;data];
%     st=fgetl(fid);
% end
% fclose(fid);
% gam2=elem(1,1)-1;
% % for use in next programing.........
% elem2user=elem(:,1);
% % for use in next programing.........
% elem(:,6)=elem(:,1);
% elem(:,1)=[];
% % elem=elem-gam1;
% nelem=size(elem,1);
% %............................................
% %[][][][][][][][][][][][][][][][][][][][][][]
% toc
% 
% tic;
% %[][][][][][][][][][][][][][][][][][][][][][]
% %................creat coord.................
% coord=[];
% st_add3=[st_add,'\node.txt'];
% fid=fopen(st_add3);
% st=fgetl(fid);
% while(st~=-1)
%     data=str2num(st);
%     coord=[coord;data];
%     st=fgetl(fid);
% end
% fclose(fid);
% if(size(coord,2)==4)    coord(:,4)=[];  end
% nnode=size(coord,1);
% % for use in next programing.........
% % node2user=coord(:,1);
% % for use in next programing.........
% gam1=coord(1,1)-1;    coord(:,1)=[];
% elem(:,1:4)=elem(:,1:4)-gam1;
% 
% %............................................
% %[][][][][][][][][][][][][][][][][][][][][][]
% toc













