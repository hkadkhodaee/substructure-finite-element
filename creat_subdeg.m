function creat_subdeg()
global subinfo;
nsub=size(subinfo,1);
global subnode;
global order;
global subdeg;
% global subc1;
global deg2sub;
global nnode;
% global maxsub_in_node;
global mxsub
% deg2sub=zeros(nnode*2,mxsub*2+1);
tic;
for i=1:nsub
    size_subnode=subinfo(i,4)/2;
    subnode0=subnode(i,1:size_subnode);
    degs1=[];    degs2=[];    degs3=[];
    for j=1:size_subnode
        %....modified
        degg=subnode0(j)*2-1;
        degs=[degg,degg+1];
        %....modified
        %degs=[subnode0(j)*2-1,subnode0(j)*2];
        for k=1:2
            deg=degs(k);
            if(order(deg)==1)   degs1=[degs1,deg];      end
            if(order(deg)==2)   degs2=[degs2,deg];      end
            if(order(deg)==3)   degs3=[degs3,deg];      end
        end
    end
    siz1=size(degs1,2);
    siz2=size(degs2,2);
    siz3=size(degs3,2);
    siz=siz1+siz2+siz3;
    subdeg(i,1:siz)=[degs3,degs2,degs1];
    subinfo(i,4)=siz;
    subinfo(i,2)=siz3+siz2;
    subinfo(i,3)=siz2;
end
toc
tic;

for i=1:nsub
    subdeg0=subdeg(i,:);
    subdeg_size=subinfo(i,4);
    for j=1:subdeg_size
        node_global=subdeg0(j);
        deg2sub(node_global,mxsub*2+1)=deg2sub(node_global,mxsub*2+1)+1;
        num=deg2sub(node_global,mxsub*2+1);
        %substructure number
        deg2sub(node_global,num)=i;
        %relating node to the specifyed substructure
        deg2sub(node_global,num+mxsub)=j;        
    end
end
toc
% subdeg=[subnode,subnode]

%.........creat subinfo(:,5)...........
global nsub2;
global maxdeg2;
global sub_level;
global sub_int;
display('....................')
tic;
% nsub2=0;
maxdeg2=[];
sub_int=[];
for i=1:size(sub_level,2)
    if(sub_level(i)==1)
        subinfo(i,5)=1;
%         nsub2=nsub2+1;
        maxdeg2=[maxdeg2,subinfo(i,4)];
        sub_int=[sub_int,i];
    else
        subinfo(i,5)=0;
    end
end
toc
tic;
nsub2=size(maxdeg2,2);
maxdeg2=max(maxdeg2);
toc
%......................................
