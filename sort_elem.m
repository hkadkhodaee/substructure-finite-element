function elem=sort_elem(elem,nnode,keynode)
global m;
global n;
%st_add='C:\Users\Mahak110\Desktop\modify\input_data\data5';
%elem=read_elem(st_add);
%nnode=961;
nelem=size(elem,1);

elem(:,5)=zeros(nelem,1);

tic;
use=zeros(nnode,1);
useofelem=ones(nelem,1);
elemofnode=zeros(nnode,5);
for i=1:nelem
    for j=1:4
        node=elem(i,j);
        use(node)=use(node)+1;
        
        num=elemofnode(node,5)+1;
        elemofnode(node,5)=num;
        elemofnode(node,num)=i;
        
    end
end

if(keynode==0)
    
start_nodes=[];
for i=1:nnode
    if(use(i)==1)
        start_nodes=[start_nodes,i];
    end
end

start_nodes=sort(start_nodes)
key=start_nodes(1);

else
    key=keynode;
end

temp_key=1;
elem2=[];
elem_key=elemofnode(key,1);


bool1=true;
m=0;
n=0;
while(bool1)
    %...for specify temp_key & key2 in next steps
    elems=elemofnode(key,1:4);
    bool5=true;
    ii=0;
    while(bool5)
        ii=ii+1;
        elem_key=elems(ii);
        if(useofelem(elem_key)==1)  bool5=false;    end
    end
    temp_elem=elem(elem_key,:);
    num=find(temp_elem==key);
    num1=mod( (num+3) ,4);
    if(num1==0) num1=4;     end;
    temp_key=temp_elem(num1);
    n=n+1;

    %........................................
    bool2=true;
    while(bool2)
        elems=elemofnode(key,1:4);
        bool3=true;
        ii=0;
        while(bool3)
            ii=ii+1;
            elem_key=elems(ii);
            if(useofelem(elem_key)==1)  bool3=false;    end
        end
        temp_elem=elem(elem_key,1:4);
        elem2=[elem2;temp_elem];
        useofelem(elem_key)=0;
        use(temp_elem)=use(temp_elem)-1;
        num=find(temp_elem==key);
        num2=mod( (num+1) ,4);
        if(num2==0) num2=4;     end;
        key=temp_elem(num2);
        if(use(key)==0)    bool2=false;    end
    end
    key=temp_key;
    if(use(key)==0)    bool1=false;    end
end
elem=elem2;
elem2=[];
m=nelem/n
toc



    
  
    