function input_data_auto(auto_coord,auto_elem,st_add,condition)
global subinfo;
global sub;
global m1;  global m2;
global n1;  global n2;
global m;   global n;
global na1; global nb1;
global na2; global nb2;
global na3; global nb3;
global na4; global nb4;
global nsub;
global nsub2;

global coord;
global elem;
global nelem;
global elem2user;
global nnode;

global maxelem;
global keynode;

sub=[];
subinfo=[];
nsub=0;

global a;   global b;
%<><><><><><><><>><><>create or read elem<><><><><><><><><>
if(auto_elem)
    display('create elem <><><><><><><><><><><>')
    elem=creat_elem_num(m,n);
else
    elem=read_elem(st_add);
    
end
nelem=size(elem,1);
%..........................................................

%<><><><><><><><>><<>create or read coord<><><><><><><><><>
if(auto_coord)
    display('create coord  <><><><><><><><><><>')
    coord=creat_coord(a,b,m,n);
else
    coord=read_coord(st_add);
end
nnode=size(coord,1);
%..........................................................
%elem=sort_elem(elem,nnode,keynode);
if(auto_elem==0)
    elem=sort_elem(elem,nnode,keynode);
end
if(condition==1)
    m1=1;   m2=m+1;
    n1=1;   n2=n+1;
end


% m1=2;   m2=12;
% n1=2;   n2=12;
bool1=false;    bool2=false;    bool3=false;    bool4=false;
if((m1~=0 || m2~=0) && ((m2-m1)>0) && ((n2-n1)>0) )                    bool4=true;     end
if(m1>1 || ~bool4)                    bool1=true;     end
if((1<n1 || n2<n+1) && bool4)         bool2=true;     end
if(m2<m+1  && bool4)                  bool3=true;     end


%......craet sub1
if(bool1)
    display('create region 1......');
    mm=m1-1;
    nn=n;
    jump=0;
    gam1=0;
    creat_sub4(mm,nn,na1,nb1,gam1,jump);
end
%................

%......craet sub2
if(bool2)
    display('create region 2......');
    mm=m2-m1;
    nn=(n1-1)+(n+1-n2);
    jump=(n2-n1)*(m);
    gam1=m1-1;
    creat_sub4(mm,nn,na2,nb2,gam1,jump);
end
%................

%......craet sub3
if(bool3)
    display('create region 3......');
    mm=m+1-m2;
    nn=n;
    jump=0;
    gam1=m2-1;
    creat_sub4(mm,nn,na3,nb3,gam1,jump);
end
%................

%......craet sub4
nsub2=nsub;
if(bool4)
    display('create region 4......');    
    mm=m2-m1;
    nn=n2-n1;
    jump=0;
    gam1= (m1-1) + (n1-1)*m;
    creat_sub4(mm,nn,na4,nb4,gam1,jump);
end
nsub2=nsub-nsub2
maxelem=max(subinfo(:,1));
%................



% if(auto2)
%     coord=creat_coord(a,b,m,n);
%     nnode=size(coord,1);
%     elem=creat_elem_num(m,n);
%     nelem=size(elem,1);
% else
    %[][][][][][][][][][][][][][][][][][][][][][]
    %...............creat elem...................
%     elem=[];
%     st_add2=[st_add,'\elem.txt'];
%     fid=fopen(st_add2);
%     st=fgetl(fid);
%     while(st~=-1)
%     data=str2num(st);
%     elem=[elem;data];
%     st=fgetl(fid);
%     end
%     fclose(fid);
%     gam2=elem(1,1)-1;
%     % for use in next programing.........
%     elem2user=elem(:,1);
%     % for use in next programing.........
%     elem(:,6)=elem(:,1);
%     elem(:,1)=[];
%     % elem=elem-gam1;
%     nelem=size(elem,1);
%     %............................................
%     %[][][][][][][][][][][][][][][][][][][][][][]
%     toc
% 
%     tic;
%     %[][][][][][][][][][][][][][][][][][][][][][]
%     %................creat coord.................
%     coord=[];
%     st_add3=[st_add,'\node.txt'];
%     fid=fopen(st_add3);
%     st=fgetl(fid);
%     while(st~=-1)
%     data=str2num(st);
%     coord=[coord;data];
%     st=fgetl(fid);
%     end
%     fclose(fid);
%     if(size(coord,2)==4)    coord(:,4)=[];  end
%     nnode=size(coord,1);
%     % for use in next programing.........
%     % node2user=coord(:,1);
%     % for use in next programing.........
%     gam1=coord(1,1)-1;    coord(:,1)=[];
%     elem(:,1:4)=elem(:,1:4)-gam1;
% 
%     %............................................
%     %[][][][][][][][][][][][][][][][][][][][][][]
%     toc
% end
% coord
% elem
