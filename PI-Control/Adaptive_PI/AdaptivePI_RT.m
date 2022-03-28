% count dögü sayacı al
% amp freq offset istenen dalga (w) için al
% 

if count == 0

    finished = 0;
    num = 3;
    
    % desired specifications
    % damping ratio
    zeta=1;
    % natural frequency
    wn = 4;

    load('motor_first_order.mat')
    LA=length(A);
    LB=length(B);
    G=tf(B,A);

    %sampling period
    h=1/50;
    
%initial state
X=zeros(LA-1,1);
r = 0 + 10.*randn(length(0:h:60),1);
    
    %SS repr. of the system
    [a,b,c,d]=tf2ss(B,A);
    [a,b]=c2d(a,b,h);


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

    %estimated system initialization
    Be=ones(1,LB);
    Ae=ones(1,LA);
    LAe=length(Ae);
    LBe=length(Be);

    %estimator parameters
    alpha=0.0001;
    sprev=alpha*eye(LAe+LBe-1);
    beta=0;
    ffactor=exp(-beta*h);

    %Filter TF && SS Representation
    % froot=1/15;
    % froot=0.6;
    % froot=0.02;
    froot=8;
    TF=[1 froot];
    for k=1:LA-1
        TF=conv(TF,[1 froot]);
    end
    % T=T/T(end);
    LTF=length(TF);
    [at,bt,ct,dt]=tf2ss(1,TF);
    [atd,btd]=c2d(at,bt,h);

    %estimated parameter initialization
    thetae=[Be';Ae(1:end-1)'];
    Aest=[];
    Best=[];

    %initial states
    phiu=zeros(LTF-1,1);
    phiy=phiu;

    %initial signals
    phiprev=zeros(LAe+LBe-1,1);    %initial data vector
    yfprev=0;                       %initial filtered output
    THETAE=[];                     %parameter history
    
end

THETAE=[THETAE thetae];

%data vector
phiu=atd*phiu+btd*ui;
phiy=atd*phiy+btd*yi;
phi=[phiu(LTF-LBe:end); -phiy(LTF-LAe:end-1)];
yf=phiy(end);   %filtered output

s=ffactor*sprev+(ffactor*phiprev*phiprev'+phi*phi')*h/2;
%parameter update
thetae=thetae+inv(s)*(ffactor*phiprev*(yfprev-phiprev'*thetae)+phi*(yf-phi'*thetae))*h/2;

%parameter track
Be=thetae(1:LBe)';
Ae=thetae(LBe+1:end)';    %actually Ae=[Ae 1]
Best=[Best Be'];
Aest=[Aest Ae'];

sprev=s;
yfprev=yf;
phiprev=phi;

% set-point
wi = amp * sign(sin(2*pi*count*h*freq)) + offset;
w = [w wi];

% error
ei=wi-yi;
e=[e ei];

% PI controller parameters
Kp=Be(1);    T=Ae(1);
Kc=(2*zeta*wn*T-1)/Kp;
Ti=(2*zeta*wn*T-1)/(wn^2*T);

% pass through PI controller
numC=Kc*[Ti 1];
denC=Ti*[1 0];
[ac,bc,cc,dc]=tf2ss(numC,denC);
[ac,bc]=c2d(ac,bc,h);

Xc=ac*Xc+bc*ei;
ui=cc*Xc+dc*ei;

if ui>=10
    ui=10;
elseif ui<-10
    ui=-10;
end

u=[u ui];   % ui output
y = [y yi]; % yi input

if count == num/(h*freq) - 1
    finished = 1;
end
