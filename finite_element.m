clear all
clc
tic;
global time;    global restrain;    global m;   global n;   global elem;
global coord;
global D;
%...........................................................
display('Generate element & restrain');
global a;   global b;
global gam1;
global nnode;
global nelem;
global f;
gam1=0;

tictoc=toc;     time(1)=tictoc;
%[][][][][][][][][][][][]  input [][][][][][][][][][][][][] 
%..............from gid output
auto_elem=0;
auto_coord=0;
manual_rest=0;
manual_f=0;
read_mode=1;
%st_add='C:\Users\Mahak110\Desktop\modify\input_data\data2';
st_add='C:\Users\Mahak110\Desktop\modify\input_data\data6_1';
%..............

%..............auto meshing
m=30;   n=30;
a=3;    b=3;
auto_elem=1;
auto_coord=1;
manual_rest=1;
manual_f=1;
read_mode=1;
st_add='C:\Users\Mahak110\Desktop\modify\input_data\data6_2';
%..............

%[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][] 

%<><><><><><><><>><><>create or read elem<><><><><><><><><>
if(auto_elem)
    display('create elem <><><><><><><><><><><>')
    elem=creat_elem_num(m,n);        %......time2
else
    elem=read_elem(st_add);
end
nelem=size(elem,1)
%..........................................................

%<><><><><><><><>><<>create or read coord<><><><><><><><><>
if(auto_coord)
    display('create coord  <><><><><><><><><><>')
    coord=creat_coord(a,b,m,n);      %......time3
else
    coord=read_coord(st_add);
end
nnode=size(coord,1)
%..........................................................

%<><><><><><><><>><<>create or read restrain<><><><><><><>
restrain=zeros(nnode*2,1);
if(manual_rest)
restrain=creat_rest(0,0,0,3);  %......time4
else
    read_restrain(st_add,read_mode);
end
%..........................................................

%<><><><><><><><>><<>create or read force<><><><><><><><><>
f=zeros(nnode*2,1);
if(manual_f)
f(nnode*2)=-1;
else
    read_force(st_add,read_mode);
end
%..........................................................

%<><><><><><><><>><<>create material<><><><><><><><><><><>
nu=0.3;planecondition=1;E=2.0000e+011;  E=1;
D=creat_material(planecondition,nu,E);
%..........................................................

tic;
kmain0=zeros(nnode*2);
fmain0=zeros(nnode*2,1);        %fmain0(nnode*2)=-1;
fmain0=f;
tictoc=toc;     time(1)=time(1)+tictoc;

%Calculate Analysis.........................................
display('Calculate Analysis');
%st=[-.557,-.577 ; .577,-.577 ; .557,.557 ; -.557,.577];
display('creat k amd assemble');
tic;
for j=1:nelem
    elem_number=j;
    kelem=creat_kelem(elem_number);
% Assemble k
        for k=1:4
            node1=elem(j,k);           
            for m=1:4
                node2=elem(j,m);
                kmain0(node1*2-1:node1*2,node2*2-1:node2*2)=kmain0(node1*2-1:node1*2,node2*2-1:node2*2)+kelem(k*2-1:k*2,m*2-1:m*2);
            end
            %fmain0(2*node1-1:2*node1)=fmain0(2*node1-1:2*node1)+f0(2*k-1:2*k,tempelem);
        end
end
tictoc=toc;     time(5)=tictoc;     %......time5
%...........................................................

%apply boundary conditions
tic
for i=nnode*2:-1:1
    if(restrain(i)==1)
        kmain0(i,:)=[];         kmain0(:,i)=[];
        fmain0(i)=[];
    end
end
tictoc=toc;     time(6)=tictoc;     %......time6
%..........................


% main equation u=inv(k)*f
tic;
uha=kmain0\fmain0;
tictoc=toc;     time(7)=tictoc;     %......time7
tic;
%.........................

%substitute u in main 
c1=0;
ufinal=zeros(nnode*2,1);
for i=1:nnode*2
    if(restrain(i)==0)
        ufinal(i,1)=uha(i-c1);
    else
        c1=c1+1;
    end
end
tictoc=toc;     time(8)=tictoc;     %......time8
%.....................
ufinal
     
    
    
    


%..........................................................

%f=rand(nnode*2,1);
%.....................................................
%nelem=4
%coord=[0	1; 1	1; 2	1; 3	1; 4	1; 0	0; 1	0; 2	0; 3	0; 4	0];
%%elem=[ 1	2	6	7; 2	3	7	8; 3	4	8	9; 4	5	9	10];
%elem=[ 6   7   2	1; 7	8	3	2; 8	9	4	3; 9	10	   5	4];

%nnode=10;
%restrain=zeros(1,nnode*2);  restrain(1)=1;restrain(2)=1;restrain(11)=1;restrain(12)=1;
%nrest=4;
%........................................................................    