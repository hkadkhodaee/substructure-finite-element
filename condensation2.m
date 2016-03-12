function condensation2(n_i,n_b)
global time;
global time3;
%tic;
global ksub0;   global fsub0;   global ksize;   global subinfo;        global subdeg0;    %global subnode0;   
global kmain;   global fmain;    global deg2bound; %global node2bound;
%condense operation of each substructure
    %sort internal & boundary degrees......................................
    %c1=sort_ib()
    % c1 is the number of a substructure boundary with other substructures
    %......................................................................
    

    


    
    %create kii,kbb,kib,kbi for condensataion.............................
%     kii=ksub0(1:ksize-n_i,1:ksize-n_i);
%     kbb=ksub0(ksize-n_i+1:ksize,ksize-n_i+1:ksize);
%     kib=ksub0(1:ksize-n_i,ksize-n_i+1:ksize);
%     kbi=kib.';
%display('######condense');
%tic;
n_i;
n_b;
ksub0;
    kii=ksub0(1:n_i,1:n_i);
    kbb=ksub0(n_i+1:ksize,n_i+1:ksize);
    kib=ksub0(1:n_i,n_i+1:ksize);
    kbi=kib.';
    
    fsubtemp1=fsub0(ksize-n_b+1:ksize);
    fsubtemp2=fsub0(1:ksize-n_b);
    % modification because of perevent of non index matrix
    if(n_b==0)   kib=0;  kbb=0;   kbi=0;    fsubtemp1=0;      end
    if(n_b==ksize)   kii=0;  kib=0;  kbi=0; fsubtemp2=0;      end
    %.....................................................................
    %Condensation and obtain kcondens and fcondens
    tic;
    if(n_b~=ksize)
        %....................
        kcondens=kbb-kbi*(kii\kib);
        fcondens=fsubtemp1-kbi*(kii\fsubtemp2);
        
        %....................
    else
        % because in this case, kii,kib,kbi are zero;
        kcondens=kbb;
        fcondens=fsubtemp1;
    end
    tictoc=toc;
    time3(1)=time3(1)+tictoc;

%kcondens
c4=0;
%toc
%display('#####assemble');
%tictoc=toc;
%time(11)=time(11)+tictoc;
tic;
for j=n_i+1:1:ksize
    deg0=subdeg0(j);
    deg1=deg2bound(deg0);
    if(deg1~=0)
        deg3=(j-(n_i));
        fmain(deg1)=fmain(deg1)+fcondens(deg3);
        for k=n_i+1:1:ksize
            deg00=subdeg0(k);
            deg2=deg2bound(deg00);
            if(deg2~=0)
                deg4=(k-(n_i));
                kmain(deg1,deg2)=kmain(deg1,deg2)+kcondens(deg3,deg4);
            end
        end
    end
end
tictoc=toc;
time3(5)=time3(5)+tictoc;
% tictoc=toc;
% time(11)=time(11)+tictoc;
%fcondens; 
    
    
    