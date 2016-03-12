clear all;
clc;
global time;
global sub;     global subinfo;
global elem;    global coord;
global nsub;
global nnode;   global nelem;
global maxelem;
global gam1;    global gam2;
global node2user;   global elem2user;
global usef;
global subnode;
global maxnode;
global order;
global mahdi;
global restrain;
global deg2bound;
global bdeg2;
global subdeg;
global deg2sub;
global subc1;
%............
%global subinfo;
%global sub;
global m1;  global m2;  global n1;  global n2;
global m;   global n;
global a;   global b;
a=3;    b=3;
global na1; global nb1;
global na2; global nb2;
global na3; global nb3;
global na4; global nb4;
%global nsub;
global nsub2;
%............
% global maxsub_in_node;
maxsub_in_node=4;
global mxsub
mxsub=maxsub_in_node
global keynode;
keynode=0;
condition=0;
gam1=0;
%...input sub,subinfo,elem,coord,nsub,nnode,nelem,maxelem,gam1,gam2
%from specified texts(region1,2,.. & elem & node)

auto_sub=1;
auto_coord=1;
auto_elem=1;
manual_f=1;
manual_rest=1;
manual_sublevel=0;

m=12;   n=12;
m1=5;   m2=9;
n1=5;   n2=9;

m=200;   n=300;
m1=201;   m2=201;
n1=301;   n2=301;

m=200;  n=200;
m1=201;   m2=201;
n1=201;   n2=201;

m=100;  n=200;
m1=101; m2=101;
n1=201; n2=201;


%m1=0;   m2=0;
% m=150;   n=150;
% m1=20;  m2=25;
% n1=20;  n2=25;
% m1=1;   m2=13;
% n1=1;   n2=13;

na1=2;  nb1=3;  %na1=1;  nb2=3;
na2=2;  nb2=3;  %na2=2;  nb2=1;
na3=2;  nb3=4;  %na3=1;  nb=4;
na4=2;  nb4=2;  %na4=4;  nb4=4;

na1=10; nb1=14;

na1=11;  na2=11;

na1=5;  nb1=21;

m=40;   n=20;
m1=1;   m2=41;
n1=1;   n2=21;
na4=8;  nb4=6;

m=100;  n=100;
na4=8;  nb4=8;

m=40;   n=20;
na4=7;  nb4=3;

m=30;   n=30;
na4=30;  nb4=30;
%..............
m1=1;   m2=m+1;
n1=1;   n2=n+1;
%..............
%..............

%na4=40;  nb4=20;
%na4=40; nb4=20;
% na1=3;  nb1=7;
% na2=3;  nb2=7;
% na3=7; nb3=7;
% na4=4;  nb4=4;
% m=60;   n=40;
% m1=1;   m2=61;  n1=1;   n2=41;
% na4=60; nb4=40;
st_add='input_data\data4';

%..............
%ÈÑÇí Íá ãÓÇáå äÇãÙã
st_add='C:\Users\Mahak110\Desktop\modify\input_data\data2';
auto_sub=0;
manual_sublevel=1;
%..............
%..............
%ÈÑÇí Íá ãÓÇáå ãÞíÏ
m=400;  n=200;
m1=1;   m2=201;     n1=1;   n2=201;
na3=11;  nb3=11;
na4=11; nb4=11;
manual_sublevel=0;
auto_sub=1;     auto_coord=1;
auto_elem=1;
manual_f=1;     manual_rest=1;
%..............
%..............
m=60;   n=60;
m1=1;  m2=61;
n1=1;  n2=61;
na4=5;   nb4=6;
manual_sublevel=0;
auto_sub=1;     auto_coord=1;
auto_elem=1;
manual_f=1;     manual_rest=1;

%..............
% ÈÑÇí Íá ãÓÆáå ãäÙã 30ÏÑ30
st_add='C:\Users\Mahak110\Desktop\modify\input_data\data5';
manual_sublevel=0;
auto_sub=1;     auto_coord=0;
auto_elem=0;
manual_f=0;     manual_rest=0;
read_mode=1;
condition=1;
keynode=961;
na4=10;  nb4=10;
%..............

%..............
% ÈÑÇí Íá ãÓÆáå ãäÙã 30ÏÑ30
st_add='C:\Users\Mahak110\Desktop\modify\input_data\data6_1';
manual_sublevel=0;
auto_sub=1;     auto_coord=0;
auto_elem=0;
manual_f=0;     manual_rest=0;
read_mode=1;
condition=1;
keynode=1;
na4=5;  nb4=5;
%..............
% st_add='C:\Users\Mahak110\Desktop\modify\input_data\data6_2';
% m=30;n=30;
% auto_sub=1;     auto_coord=1;
% auto_elem=1;    manual_f=1;
% manual_rest=0;
% na4=5;  nb4=5;
%..............

%..............

% create or read sub & elem & coord..............................
if(auto_sub)
    input_data_auto(auto_coord,auto_elem,st_add,condition);
else
    input_data(st_add);
end
%_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
elem(1:10,:)
% %...must be deleted
% elem2=elem;
% elem2(:,1)=elem(:,3);
% elem2(:,2)=elem(:,2);
% elem2(:,3)=elem(:,1);
% elem2(:,4)=elem(:,4);
% elem=elem2;
% elem2=[];
% %..................

%manual or read restrain..........................................
restrain=zeros(1,nnode*2);
if(manual_rest)
    %nrest=[1 2 27 28 53 54 79 80 105 106 131 132 157 158 183 184 209 210 235 236 261 262 287 288 313 314];
    %restrain(nrest)=1;
    nrest=[1 32	63	94	125	156	187	218	249	280	311	342	373	404	435	466	497	528	559	590	621	652	683	714	745	776	807	838	869	900	931];
    restrain(nrest*2-1)=1;
    restrain(nrest*2)=1;
else
    read_restrain(st_add,read_mode);
end
%_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
find(restrain~=0)
%creat material..................................................
tic
time=0;
nu=0.3; planecondition=1; E=2.0000e+011; E=1;
tictoc=toc;     time(1)=time(1)+tictoc;
global D;
D=creat_material(planecondition,nu,E);
%_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

%manual or read Force............................................
global f;
f=zeros(nnode*2,1);
if(manual_f)
    %...case1.....
    f(nnode*2)=-1;
    %...case2.....
%     node1=[29	50	74	105	138	166	197	227	259	308	348	390	422	456	498	541	585	623	672	717	760	803	840	876	921];
%     node2=[570	606	643	683	722	758	796	829	866	905	932	954	969	985	1001 1012 1023 1030 1035 1040 1042];
%     for i=1:size(node1,2)
%         node=node1(i);
%         f(2*node)=100;
%     end
%     for i=1:size(node2,2)
%         node=node2(i);
%         f(2*node)=-100;
%     end
else
    read_force(st_add,read_mode)
end
%_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

%f=f*100000000000

%manual or create sub_level......................................
global sub_level;
global sub_int;
sub_level=zeros(1,nsub);
if(manual_sublevel)
    %...case 1....
%     sub_level=zeros(1,nsub);
    %...case 2....
    sub_level=ones(1,nsub);
else
    temp=nsub-nsub2;
    for i=temp+1:nsub
        sub_level(i)=1;
    end
end
%_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

%|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
%|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
%|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
%|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
%>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>
%>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>
%>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>...>>>
display('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>')


display('.....................find subnode ......................')
%Find subnode    0000000000000000000000000000000000000000000000000
%*************************************
% input global variables
%subinfo...elem...nsub...nnode...nelem...maxelem...usef...subnode...maxnode
%output
%subnode...subinfo(:,4)...usef...maxnode
%*************************************

find_subnode(sub);

display('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>')


display('...................Create felem ........................')
%Create felem     000000000000000000000000000000000000000000000000

tic;
global felem;
% nelem=m*n;
for i=1:nelem
    for k=1:4
    node=elem(i,k);
    c=usef(node);
    felem(2*k-1,i)=f(2*node-1)/c;         felem(2*k,i)=f(2*node)/c;
    end
end
toc

display('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>')


display('...................Create order ........................')
%Create order     000000000000000000000000000000000000000000000000
%*************************************
% input global variables
%subnode...subinfo...restrain...nnode
%output
%order...subinfo(:,4)...usef...maxnode
%*************************************

order=creat_order();

display('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>')


display('...................Create bdeg2 ........................')
%Create bdeg2 & deg2bound     000000000000000000000000000000000000
%*************************************
% input global variables
%time...nnode...order...deg2bound...bdeg2
%output
%deg2bound...bdeg2
%*************************************

deg2bound=zeros(1,nnode*2);

bdeg2=[];
tic;
creat_bdeg2()
toc

display('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>')


display('...................Create subdeg ........................')
%Create subdeg     000000000000000000000000000000000000000000000000
%*************************************
% input global variables
%subinfo...subnode...order...subdeg...deg2sub...nnode...mxsub
%nsub2...maxdeg2...sub_level...sub_int.......................
%output
%subdeg...subinfo(:,2:5)...deg2sub...maxdeg2...sub_int..nsub2
%*************************************


deg2sub=zeros(nnode*2,mxsub*2+1);
global maxdeg2;
creat_subdeg()

display('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>')


%..............................................
%global time;
global ksub0;   global fsub0;   global ksize;   %global subinfo;        global subdeg0;      
global kmain;   global fmain;   %global deg2bound; 
global felem;
global subdeg0; global subinfo_i;
%global elem;   %global node2sub;   %global deg2sub;
%...........
%tic;

%...........

s_ksub=zeros(maxdeg2,maxdeg2,nsub2);
fsub=zeros(maxdeg2,nsub2);
siz=size(bdeg2,2);
fmain=zeros(siz,1);
kmain=zeros(siz,siz);
% related with substructures with internal degs
ci=0;
%...................assemble & condense operation......................
%[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
%[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
global time3;
time3=[0,0,0,0,0];
c_sub=[];
for i=1:nsub
    subelem=sub(i,:);
    subinfo_i=subinfo(i,:);
    fsubksub=creatk_assemble2(subelem,subinfo_i,i);
    ksize=subinfo_i(2);
    subdeg_size=subinfo_i(4);
    fsub0=fsubksub(:,1);    fsubksub(:,1)=[];
    %apply boundary condition
    ksub0=fsubksub(1:ksize,1:ksize);
    fsub0=fsub0(1:ksize);
    %[][][][][][][][][][][][]
    %save ksub for substructures which internal degs are needed
    if(subinfo_i(5)==1)
        ci=ci+1;
        s_ksub(1:ksize,1:ksize,ci)=ksub0;
        fsub(1:ksize,ci)=fsub0;
        c_sub=[c_sub,i];
    end
    %[][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
    subdeg0=subdeg(i,:);  
    n_b=subinfo(i,3);       n_i=ksize-n_b;
    % Condense operation and creatk_assemble for each substructure
    condensation2(n_i,n_b);
    %[][][][][][][][][][][][][][][][][][][][][][][][][][][][][]][]
    
end
%...................main Equation for boundary degs...................
%[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
%[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
display('umain');
global umain;
umain=zeros(siz,1);
tic;
umain=kmain\fmain;
tictoc=toc
time3(2)=tictoc;

%...................Calculate internal displacement....................
%[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
%[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
global u;
u=zeros(nnode*2,1);
for ci=1:nsub2
    i=c_sub(ci);
    subinfo_i=subinfo(i,:);
    subdeg0=subdeg(i,:);
    ksize=subinfo_i(2);
    ksub0=s_ksub(1:ksize,1:ksize,ci);
    fsub0=fsub(1:ksize,ci);
    
    calculate_internal()
end
%...............substitution boundary displacement in (u)..............
%[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
%[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
for i=1:size(bdeg2,2)
    deg1=bdeg2(i);
    u(deg1)=umain(i);
end
%u
[time3(1:3),sum(time3(1:3))].'
%sum(time3(1:3))


