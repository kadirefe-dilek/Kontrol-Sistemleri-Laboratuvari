% Defining the function MyCircle()
function[]= MyCircle(ctr,rds,n,styl) 

    %With bellow seven lines inputs also entered by user in code 
    %ctr=[1:2];
    %rds=input("Radius:");
    %for n=1:2;
    %    ctr(1,n)=input("Center:");
    %end
    %n=input("Number of the points:");
    %styl=input("Style of the plot:","s");

    teta=0:2*pi/n:2*pi;	%It indicates the number of the points on the circle
    xunit=rds*cos(teta)+ctr(1,1);	% It is the distance between center and y axis which %means x coordinate 
    yunit=rds*sin(teta)+ctr(1,2);	% It is the distance between center and x axis which %means y coordinate 

    plot(xunit,yunit,styl);
    grid;

    xlim([ctr(1)-(rds+1) ctr(1)+(rds+1)]); % Determines the limits of the coordinates on the %x-axis as center point-radius-1
    ylim([ctr(2)-(rds+1) ctr(2)+(rds+1)]); % Determines the limits of the coordinates on the %y-axis as center point-radius-1

end
