function elem= creat_elem_num(m,n)
tic;
c1=0;
for i=1:n
    for j=1:m
        c1=c1+1;
        n1=j+(m+1)*i;
        n2=n1+1;
        n3=n2-(m+1);
        n4=n3-1;
        elem(c1,1:4)=[n1,n2,n3,n4];
    end
end
tictoc=toc
global time
time=[time,tictoc];
