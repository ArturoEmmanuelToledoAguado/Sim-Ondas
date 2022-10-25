clear all;
close all;
f=100e6;
T=1/f;
v_g=120*sqrt(2);
l=200;
G=(75-50)/(75+50);
g=.0017+2.5541i;
%x=-200:.1:0;%Completo
%x=-110:.1:-90; % a la mitad, cerca del cewntro
%x=-10:.1:0;%En la carga Z_L
x=-200:.1:-190;%En el generador
p=floor(length(x)/2);%Posicion deonde se quiere el valor
v0ma=v_g*exp(-g*l);
v0me=v0ma*G;
k=1;
for t=0:T/100:5*T
    %Calculo del volt +
    v_=v0ma*exp(-g*x)+v0me*exp(g*x);
    %v_=v0ma*exp(-g*x);%Parte real
    %v_=v0me*exp(g*x);%Parte imaginaria
    %Parte real
    v=real(v_*exp(2i*pi*f*t));
    vp(k)=max(v);
    k=k+1;
    plot(x,v)
    ylim([-200 200]);
    drawnow
end
figure()
plot(vp)%Se deve ver una senoide perfecta de amplitud constante
%Maximo y minimo, es decir los valores que alcanza al oscilar la senoide v
max(vp)
min(vp)
ROE=max(vp)/min(vp)