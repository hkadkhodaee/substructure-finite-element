function D=creat_material(planecondition,nu,E)
global time;
tic;
if (planecondition==1)
    D=E/(1-nu^2)*[1 nu 0;nu 1 0;0 0 (1-nu)/2];
else
    D=E/(1+nu)/(1-2*nu)*[1-nu nu 0;nu 1-nu 0;0 0 (1-2*nu)/2];
end
tictoc=toc;
time(1)=time(1)+tictoc;

