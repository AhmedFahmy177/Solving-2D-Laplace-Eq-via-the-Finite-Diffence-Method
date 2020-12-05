clear
clc

%Inputs:
Nx=50;
Ny=50 ;
Lx=1;
Ly=1;

%Grid
x=linspace(0,Lx,Nx);
y=linspace(0,Ly,Ny);
dx = x(2)-x(1) ;
dy = y(2)-y(1) ;

%Initialize matrices
N=Nx * Ny ;         %(number of unknowns)
M=zeros(N,N);        % N rows and N columns
B=zeros(N,1);        % N rows and 1 column

%Interior Points
for i=2:Nx-1    %Loop over the x direction skipping the 1st and last grid points.
    for j=2:Ny-1  %Loop over the y direction skipping the 1st and last grid points.
  n=i+(j-1)*Nx ;    %converting from the i,j grid to the n-th grid.
  M(n,n)=-4 ;    %Main diagonal
  M(n,n-1)=1;    %off diagonal to the left
  M(n,n+1)=1;    %off diagonal to the right
  M(n,n-Nx)=1;   
  M(n,n+Nx)=1;
  B(n,1)= 0 ;
    end
end

    %Boundary Conditions
    
    %Left Side T = y
    i=1;
    for j=1:Ny
       n=i+(j-1)*Nx;
       M(n,n)=1;
       B(n,1)=y(j); 
        
    end
    
    %Right Side T = 1-y
    i=Nx;
    for j=1:Ny
       n=i+(j-1)*Nx;
       M(n,n)=1;
       B(n,1)=1-y(j); 
        
    end
    
    %Bottom Side T = x
    j=1;
    for i=1:Nx
       n=i+(j-1)*Nx;
       M(n,n)=1;
       B(n,1)=x(i); 
        
    end
    
    %Top Side T=1-x
    j=Ny;
    for i=1:Ny
       n=i+(j-1)*Nx;
       M(n,n)=1;
       B(n,1)=1-x(i); 
        
    end
    
    
    %solve for T
   T_vec= inv(M) *B ;
    
    
    for i=1:Nx
        for j=1:Ny
       n=i+(j-1)*Nx ;
       T(i,j)=T_vec(n);
            
        end
    end
    
    
    %Plotting
    
    surf(x,y,T');
    xlabel('x');
    ylabel('y');
    zlabel('z');
    set(gca, 'Fontsize' ,16 );
    
    


      

    
    
    
    
    
    
    
    
    