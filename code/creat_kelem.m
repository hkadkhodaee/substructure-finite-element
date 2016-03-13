function kelem=creat_kelem(elem_number)
global elem;
global coord;
global D;
st=[-.557,-.577 ; .577,-.577 ; .557,.557 ; -.557,.577];
x=[];y=[];
kelem=zeros(8);

for k=1:4
    tempnode=elem(elem_number,k);
    x=[x,coord(tempnode,1)];
    y=[y,coord(tempnode,2)];
end
for l=1:4
    s=st(l,1);   t=st(l,2);     
            
    x1=x(1);    x2=x(2);    x3=x(3);    x4=x(4);
    y1=y(1);    y2=y(2);    y3=y(3);    y4=y(4);
    df1=0.25*[x1*(t-1)-x2*(t-1)+x3*(t+1)-x4*(t+1);  x1*(s-1)-x2*(s+1)+x3*(s+1)-x4*(s-1)];
    df2=0.25*[y1*(t-1)-y2*(t-1)+y3*(t+1)-y4*(t+1);  y1*(s-1)-y2*(s+1)+y3*(s+1)-y4*(s-1)];
    J=det([df1,df2]);
    %J=df1(1)*df2(2)-df1(2)*df2(1);
    difNk=0.25*[t-1,-t+1,t+1,-t-1;s-1,-s-1,s+1,-s+1];
    B=[]; 
    for k=1:4
        df0=[ difNk(1,k) ; difNk(2,k) ];
        dfNx=det([df0,df2])/J;
        dfNy=det([df1,df0])/J;    
        bt=[dfNx,     0;
               0,  dfNy;
            dfNy,  dfNx];
        B=[B,bt];
    end
    kelem=kelem+B.'*D*B*J;
end