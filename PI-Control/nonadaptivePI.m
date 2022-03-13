% if i == 0 % i: döngü sayacı

    % desired specifications
    % damping ratio
    zeta=1;
    % natural frequency
    wn = 4;

    load('motor_first_order.mat') % A ve B verisi elle yaz
    LA=length(A);
    LB=length(B);
    G=tf(B,A);

    %sampling period
    h=1/50;

    %SS repr. of the system
    [a,b,c,d]=tf2ss(B,A);
    [a,b]=c2d(a,b,h);
    %initial state
    X=zeros(LA-1,1);

    %Controller initial state
    Xc=zeros(1,1);

    %set-point parameters
    period=20*h; %20 seconds
    amp=700;    %rpm
    bias=0;
    duration=1;   %minutes

    %initial signals
    w=[]; e=[]; y=[]; u=[];
    ui=0; yi=0;   %initial values
    eprev=0;
    eint=0;

    %simulation time
    time=duration*60;

    %Filter TF && SS Representation
    % froot=1/15;
    % froot=0.6;
    % froot=0.02;
    froot=8;
    TF=[1 froot];
    for k=1:LA-1
        TF=conv(TF,[1 froot]);
    end

    LTF=length(TF);
    [at,bt,ct,dt]=tf2ss(1,TF);
    [atd,btd]=c2d(at,bt,h);

    % PI controller parameters | nonadaptive controllerda sabitler
    Kp=B(1);    T=A(1);
    Kc = (2*zeta*wn*T-1) / Kp;
    Ti = (2*zeta*wn*T-1) / (wn^2*T);


    % output noise
    r = 0 + 10.*randn(length(0:h:time),1); % 1'den veri sayısına sayıyo


% end;

for i=0:h:time

    % set-point
    wi = amp * sign(sin(2*pi*i*h/period)) + bias; % i döngü sayacını al
    w=[w wi];
    
    % error
    ei = wi-yi;
    e = [e ei];

    % pass through PI controller
    numC = Kc*[Ti 1];
    denC = Ti*[1 0];
    [ac,bc,cc,dc]=tf2ss(numC,denC);
    [ac,bc]=c2d(ac,bc,h);
    
    Xc = ac*Xc+bc*ei;
    ui = cc*Xc+dc*ei;
    if ui >= 5
        ui = 5;
    elseif ui <- 5
        ui = -5;
    end
    u = [u ui];

    % pass through the plant        
    X=a*X+b*ui;                     % rpm içeri al X = rpm
    yi=c*X+d*ui+r(round(i/h+1));    % ui dışarı çıkart 
    y=[y yi];                       % yi içeri al yi = rpm
end

t=[0:h:duration*60];

%visualisation
figure,
plot(t,w,t,y)
title('Set-point and System Output');
xlabel('sec');
figure,
plot(t,u)
title('Control Input');
xlabel('sec');
figure,
plot(t,e)
title('Error');
xlabel('sec');
