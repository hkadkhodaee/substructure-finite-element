function creat_bdeg2()
global time;
global nnode;
global order;
global deg2bound;
global bdeg2;
c1=0;
%tic;
for i=1:nnode*2
    if(order(i)==2 && deg2bound(i)==0 )
        c1=c1+1;
        deg2bound(i)=c1;
        bdeg2=[bdeg2,i];
    end
end
%toc
c1