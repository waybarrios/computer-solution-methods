clear all;
close all
clc

opcion=0;
while opcion ~= 4
    clc
    opcion=input('Digite la opcion de su preferencia: \n 1. convoluci�n de funci�n cuadrada con funci�n cuadrada \n 2. convoluci�n de funci�n cuadrada con funci�n exponencial creciente \n 3. convoluci�n funci�n cuadrada con funci�n exponencial decreciente \n 4. terminar el programa\n');
switch opcion
    
    case 1
%----------------------------------------------------------
clc
Lx=input('Digite longitud de la 1era funcion cuadrada:');disp('');                              %Lx: Longitud de x[n]
x=1.^(0:Lx-1); 
Lh=input('Digite longitud de la 2da funcion cuadrada :');disp('');                                %Lh: Longitud de h(n)
h=1.^(0:Lh-1);                  %h: h[n]
%---------------- Gr�fica de x[n] -------------------
Eje_t=-Lh:Lx+Lh;
subplot(211)
x_t=[zeros(1,Lh) x zeros(1,Lh+1)];
plot(Eje_t,x_t);
title('x(t)');
pause;
%---------------- Gr�fica de h[n] -------------------
subplot(212)
h_t=[zeros(1,Lh) h zeros(1,Lx+1)];
plot(Eje_t,h_t);
title('h(t)');
pause;

%---------- Desarrollo de la convoluci�n ------------

for t=0:Lx+Lh-1        %Longitud del resultado de la convoluci�n = Lx+Lh-1

	%--------------- Gr�fica de x[k] ------------------
	x_T=[zeros(1,Lh) x zeros(1,Lh+1)];
      
	subplot(221)
	plot(Eje_t,x_T);
	title('x(T)')
	xlabel('T')
	grid;
    pause;

	%--------------- Gr�fica de h[n-k] -----------------
	h_t_menos_T=[zeros(1,t+1) h(Lh:-1:1) zeros(1,Lx+Lh-t)];
    subplot(223)
	plot(Eje_t,h_t_menos_T);
	title('h(t-T)')
	xlabel('T')
	grid;	
    pause;
    
    %--------------- Gr�fica de x[k]h[n-k] --------------
	subplot(222)
	plot(Eje_t,x_T.*h_t_menos_T);
	title('x(T)h(t-T)')
	xlabel('T')
	grid;
    pause;

    %--------------- Gr�fica de y[n] --------------------

	y_t(t+1)=sum(x_T.*h_t_menos_T);
	subplot(224)
	plot(-1:Lx+Lh,[0 y_t zeros(1,Lx+Lh-t)]);
	title('y(t)')
	xlabel('t')
	grid;

	pause;
end
    
    case 2
%----------------------------------------------------------
clc
Lx=input('Digite longitud de la funcion exponencial:');disp('');                              %Lx: Longitud de x[n]
x=(exp(1)).^(0:Lx-1); 
Lh=input('Digite longitud de la funcion cuadrada :');disp('');                                %Lh: Longitud de h(n)
h=1.^(0:Lh-1);                  %h: h[n]
%---------------- Gr�fica de x[n] -------------------
Eje_t=-Lh:Lx+Lh;
subplot(211)
x_t=[zeros(1,Lh) x zeros(1,Lh+1)];
plot(Eje_t,x_t);
title('x(t)');
pause;
%---------------- Gr�fica de h[n] -------------------
subplot(212)
h_t=[zeros(1,Lh) h zeros(1,Lx+1)];
plot(Eje_t,h_t);
title('h(t)');
pause;

%---------- Desarrollo de la convoluci�n ------------

for t=0:Lx+Lh-1        %Longitud del resultado de la convoluci�n = Lx+Lh-1

	%--------------- Gr�fica de x[k] ------------------
	x_T=[zeros(1,Lh) x zeros(1,Lh+1)];
      
	subplot(221)
	plot(Eje_t,x_T);
	title('x(T)')
	xlabel('T')
	grid;
    pause;

	%--------------- Gr�fica de h[n-k] -----------------
	h_t_menos_T=[zeros(1,t+1) h(Lh:-1:1) zeros(1,Lx+Lh-t)];
    subplot(223)
	plot(Eje_t,h_t_menos_T);
	title('h(t-T)')
	xlabel('T')
	grid;	
    pause;
    
    %--------------- Gr�fica de x[k]h[n-k] --------------
	subplot(222)
	plot(Eje_t,x_T.*h_t_menos_T);
	title('x(T)h(t-T)')
	xlabel('T')
	grid;
    pause;

    %--------------- Gr�fica de y[n] --------------------

	y_t(t+1)=sum(x_T.*h_t_menos_T);
	subplot(224)
	plot(-1:Lx+Lh,[0 y_t zeros(1,Lx+Lh-t)]);
	title('y(t)')
	xlabel('t')
	grid;

	pause;
end

case 3
%----------------------------------------------------------
clc
Lx=input('Digite longitud de la funcion exponencial decreciente:');disp('');                              %Lx: Longitud de x[n]
x=(exp(1)).^-(0:Lx-1); 
Lh=input('Digite longitud de la funcion cuadrada :');disp('');                                %Lh: Longitud de h(n)
h=1.^(0:Lh-1);                 %h: h[n]
%---------------- Gr�fica de x[n] -------------------
Eje_t=-Lh:Lx+Lh;
subplot(211)
x_t=[zeros(1,Lh) x zeros(1,Lh+1)];
plot(Eje_t,x_t);
title('x(t)');
pause;
%---------------- Gr�fica de h[n] -------------------
subplot(212)
h_t=[zeros(1,Lh) h zeros(1,Lx+1)];
plot(Eje_t,h_t);
title('h(t)');
pause;

%---------- Desarrollo de la convoluci�n ------------

for t=0:Lx+Lh-1        %Longitud del resultado de la convoluci�n = Lx+Lh-1

	%--------------- Gr�fica de x[k] ------------------
	x_T=[zeros(1,Lh) x zeros(1,Lh+1)];
      
	subplot(221)
	plot(Eje_t,x_T);
	title('x(T)')
	xlabel('T')
	grid;
    pause;

	%--------------- Gr�fica de h[n-k] -----------------
	h_t_menos_T=[zeros(1,t+1) h(Lh:-1:1) zeros(1,Lx+Lh-t)];
    subplot(223)
	plot(Eje_t,h_t_menos_T);
	title('h(t-T)')
	xlabel('T')
	grid;	
    pause;
    
    %--------------- Gr�fica de x[k]h[n-k] --------------
	subplot(222)
	plot(Eje_t,x_T.*h_t_menos_T);
	title('x(T)h(t-T)')
	xlabel('T')
	grid;
    pause;

    %--------------- Gr�fica de y[n] --------------------

	y_t(t+1)=sum(x_T.*h_t_menos_T);
	subplot(224)
	plot(-1:Lx+Lh,[0 y_t zeros(1,Lx+Lh-t)]);
	title('y(t)')
	xlabel('t')
	grid;

	pause;
end
end
end