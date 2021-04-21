%read file
[FileName,PathName,FilterIndex] = uigetfile('.log')
out=horzcat(PathName,FileName);
allTable=readtable(out);

%calculate
info=allTable(:,1:3);
info=info{:,:};
infoshifted=zeros(size(info));
infoshifted(2:end,:)=info(1:end-1,:);
timediff=info-infoshifted;%time between two frames
FPS=1./(timediff);
FPS=FPS(2:end,2:2);

%mean
m=mean(FPS);
s=std(FPS);

%show
tiledlayout(3,1)
nexttile
histogram(FPS);
xlabel('FPS');
ylabel('Frame number');
title('Frame distribution')
grid on

nexttile
mytime=info(2:end,2:2)-info(2,2);
plot(mytime,FPS(:,:));
xlabel('Time');
ylabel('FPS');
title('FPS in time')
grid on

nexttile
mytime=info(2:end,2:2)-info(2,2);
plot(mytime,timediff(2:end,2:2));
xlabel('Time');
ylabel('Frame interval in sec');
title('Frame interval in time')
grid on