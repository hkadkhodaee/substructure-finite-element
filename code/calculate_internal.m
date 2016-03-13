function calculate_internal()
% global subinfo;
% global subdeg;
global deg2bound;
global umain;
% global s_ksub;
global u;
%.............
global subinfo_i;
global subdeg0;
global ksub0;
global fsub0;
global time3;
%tic;
%.............
ksize=subinfo_i(2);     c1=subinfo_i(3);
% n_b=subc1(i,2);
% n_i=subc1(i,3);
n_b=subinfo_i(3);   n_i=ksize-n_b;
if(n_b~=ksize)
mahadi=20;
ub=zeros(c1,1);
if(n_b==0)   ub=0;   kib=0;  end
c5=0;
for j=n_i+1:1:ksize

    deg1=subdeg0(j);      deg2=deg2bound(deg1);
    if(deg2~=0)
    ub(j-(n_i),1)=umain(deg2);
    end


end
ub;
if(n_b==0)   ub=0;   kib=0;  end
%ub
%...........
% ksub0=s_ksub(1:ksize,1:ksize,i);
% fsub0=fsub(1:ksize,i);
%...........
kii=ksub0(1:n_i,1:n_i);
kib=ksub0(1:n_i,n_i+1:ksize);
%c1hadi
if(n_b==0)   kib=0;  kbb=0;   kbi=0;         end
if(n_b==ksize)   kii=0;  kib=0;  kbi=0;      end
tic;
if(n_b~=ksize)      ui=kii\(fsub0(1:n_i)-kib*ub);       mahadi=5; end
tictoc=toc;
%display('hello');
time3(3)=time3(3)+tictoc;
for j=1:1:n_i
    deg1=subdeg0(j);
    u(deg1)=ui(j);
end
end
%toc