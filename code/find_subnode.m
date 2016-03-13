function find_subnode(sub)
%global sub;
% tic;
global subinfo;
global elem;    %global coord;
global nsub;    
global nnode;   global nelem;
global maxelem;
% global gam1;    global gam2;
global usef;
global subnode;
global maxnode;
% global order;
% toc
tic;
usef=zeros(1,nnode);
for i=1:nsub
%     temp2=[];
    use=zeros(1,nnode);
    nsubelem=subinfo(i,1);
    c1=0;
    for j=1:nsubelem
        elem_number=sub(i,j);
        for k=1:4
            node=elem(elem_number,k);
            use(node)=use(node)+1;
            usef(node)=usef(node)+1;
            if(use(node)==1)
                c1=c1+1;
%                 temp2=[temp2,node];
                subnode(i,c1)=node;
                %....modified
%                 deg1=c1*2-1;
%                 subdeg(i,deg1:deg1+1)=[node*2-1,node*2];
             
                %....modified
            end
            subinfo(i,4)=c1*2;
        end
    end    
end
toc
maxnode=max(subinfo(:,4))/2






