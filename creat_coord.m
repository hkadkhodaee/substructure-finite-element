function coord=creat_coord(a,b,m,n)
tic;
aa=a/m;     bb=b/n;
c1=1;
for j=1:n+1
    for i=1:m+1
        coord(c1,1)=aa*(i-1);
        coord(c1,2)=bb*(n-(j-1));
        c1=c1+1;
    end
end
tictoc=toc
global time
time=[time,tictoc];
