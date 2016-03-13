function fsub_ksub=creatk_assemble2(subelem,subinfo_i,i) 
global time;    global time3;
%tic;
global felem;
global elem;
%global node2sub;
global deg2sub;
subdeg_size=subinfo_i(4);
nsubelem=subinfo_i(1);
ksub0=zeros(subdeg_size);
fsub0=zeros(subdeg_size,1);  %time(20)=0;
tic;
for j=1:nsubelem  
    %-----------------------------------calculate kelem
    
    elem_number=subelem(j);
    
    kelem=creat_kelem(elem_number);
    
    %s_kelem(:,:,elem_number)=kelem;      %must be deleted
    %--------------------------------------------------
    %tic;
    for k=1:4
        %tic
        %j
        %tic;
        node=elem(elem_number,k);
        %degg=[node*2-1,node*2];
        degg=node*2-1;
        %for v=1:2
        %deg1=degg(1);    
        degtemp=deg2sub(degg,:);
        indOfsub=find(degtemp(1:4)==i);
        deg1=degtemp(indOfsub+4);
        degtemp=deg2sub(degg+1,:);
        deg11=degtemp(indOfsub+4);
        %deg11=degg(2);    
        %degtemp=deg2sub(deg11,:);
        %indOfsub=find(degtemp(1:4)==i);
        %deg2=degtemp(indOfsub+4);        
        %tictoc=toc; time(20)=time(20)+tictoc;
        %node1=nodesub(i,elem(elem_number,k));  
        for m=1:4
            %node2=nodesub(i,elem(elem_number,m));
            %tic;
            node=elem(elem_number,m);
            degg=node*2-1;
            degtemp=deg2sub(degg,:);
            indOfsub=find(degtemp(1:4)==i);
            deg2=degtemp(indOfsub+4);
            degtemp=deg2sub(degg+1,:);
            deg22=degtemp(indOfsub+4);
            ind1=[deg1,deg11];
            ind2=[deg2,deg22];
            ksub0(ind1,ind2)=ksub0(ind1,ind2)+kelem(k*2-1:k*2,m*2-1:m*2);
%             %tictoc=toc; time(20)=time(20)+tictoc;
%             tic;
%             ksub0(node1*2-1:node1*2,node2*2-1:node2*2)=ksub0(node1*2-1:node1*2,node2*2-1:node2*2)+kelem(k*2-1:k*2,m*2-1:m*2);
%             tictoc=toc; time(8)=time(8)+tictoc;
%             ksub0(node1*2-1:node1*2,node2*2-1:node2*2)=ksub0(node1*2-1:node1*2,node2*2-1:node2*2)+kelem(k*2-1:k*2,m*2-1:m*2);
            
        end
              fsub0(ind1)=fsub0(ind1)+felem(2*k-1:2*k,elem_number);
%             fsub0(2*node1-1:2*node1)=fsub0(2*node1-1:2*node1)+felem(2*k-1:2*k,elem_number);
%         end
%     tictoc=toc;
%     time2=[time2,tictoc];            
    end

    %tictoc=toc; time(20)=time(20)+tictoc;
end
tictoc=toc;
time3(4)=time3(4)+tictoc;

fsub_ksub=[fsub0,ksub0];

%time(7)
%tictoc=toc;     time(8)=time(8)+tictoc;
