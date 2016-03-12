function restrain=creat_rest(f1,f2,f3,f4)
global m;   global n;   global time;
tic;
nnode=(m+1)*(n+1);
restrain=zeros(1,nnode*2);
%set restrain for vertical faces
for i=1:n+1
    if(f4~=0)
        node=1+(i-1)*(m+1);
        if(f4==1 || f4==3) restrain(node*2-1)=1;     end
        if(f4==2 || f4==3) restrain(node*2)=1;       end
    end
    if(f2~=0)
        node=(m+1)+(i-1)*(m+1);
        if(f2==1 || f2==3) restrain(node*2-1)=1;     end
        if(f2==2 || f2==3) restrain(node*2)=1;       end
    end
end
%set restrain for horizental faces
for i=1:m+1
    if(f1~=0)
        node=i;
        if(f1==1 || f1==3) restrain(node*2-1)=1;     end
        if(f1==2 || f1==3) restrain(node*2)=1;       end
    end
    if(f3~=0)
        node=(m+1)*n+i;
        if(f3==1 || f3==3) restrain(node*2-1)=1;     end
        if(f3==2 || f3==3) restrain(node*2)=1;       end        
    end
end
tictoc=toc;
time=[time,tictoc];
    
