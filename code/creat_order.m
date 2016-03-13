function order=creat_order()
tic;
global subnode;
global subinfo;
global restrain;
global nnode;
toc

tic;
nsub=size(subnode,1);
use=zeros(1,nnode);
order=3*ones(1,nnode*2);
% hadi=0;
% mahdi=[];
for i=1:nsub
    subnode0=subnode(i,:);
    subnode_size=subinfo(i,4)/2;
    for j=1:subnode_size
        node=subnode(i,j);
%         node11=node;
        use(node)=use(node)+1;
        if(use(node)~=1 && order(1,node*2-1)~=2)
%             hadi=hadi+1;
%             mahdi=[mahdi,node11];
            deg1=node*2-1;
            %deg2=node11*2;
            order(deg1:deg1+1)=[2;2];
        end
    end
end
toc

tic;
for i=1:nnode*2
    if(restrain(i)==1)
        order(i)=1;
    end
end
toc