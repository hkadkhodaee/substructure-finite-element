
function creat_sub4(mm,nn,na,nb,gam1,jump)
global subinfo;
global sub;
% global m1;  global m2;
global n1;  global n2;
global m;
global nsub;
global nsub2;
tic;
%...............
%temp2 contains divition sizes in X_direction
h2=mod(mm,na);
h1=(mm-h2)/na;
for i=h2+1:na
    temp1(i)=h1;
end
for i=1:h2
    temp1(i)=h1+1;
end
%temp2 contains divition sizes in Y_direction
h2=mod(nn,nb);
h1=(nn-h2)/nb;
for i=h2+1:nb
    temp2(i)=h1;
end
for i=1:h2
    temp2(i)=h1+1;
end
%.............................................................
%c1 is a counter for sub
c1=0;
c1=nsub;
% nsub2=c1;
n3=0;
n4=0;
gam2=0;
% tic
for jj=1:nb
    n3=n4+1;        
    n4=n4+temp2(jj);
    n11=0;
    n22=0;
    for ii=1:na
        c1=c1+1;
        n11=n22+1;
        n22=n22+temp1(ii);
        %c2 is a counter for sub element
        c2=0;
        
        for j=n3:n4
            for i=n11:n22
                c2=c2+1;
                if(j+1>n1)  gam2=jump;   else gam2=0; end
                
                sub(c1,c2)=i+(m)*(j-1)+gam1+ gam2;
                subinfo(c1,1)=c2;
            end
        end
        
    end
end
nsub=c1;
% nsub2=nsub-nsub2;
toc
display('.....................');
% temp2
% sub
% jump
% gam1
% nsub2
