function [] = plotcsi_modified( csi, nfft, normalize )
%PLOTCSI Summary of this function goes here
%   Detailed explanation goes here

csi_buff = fftshift(csi,2);
csi_phase = rad2deg(angle(csi_buff));
csi_buff_ = csi_buff;
csi_phase_ = csi_phase;

for cs = 1:size(csi_buff,1)
    csi = abs(csi_buff(cs,:));
    if normalize
        csi = csi./max(csi);
    end
    csi_buff(cs,:) = csi;
end

% After above line csi_buff has all magnitude calculated

figure
x = -(nfft/2):1:(nfft/2-1);

% modified line
x = x(:,[5:61]);
% modified lines
csi_buff = csi_buff(:,[5:61]);
csi_buff(:,29) = 0;

subplot(4,1,4)
imagesc(x,[1 size(csi_buff,1)],csi_buff) % to do
myAxis = axis();
axis([min(x)-0, max(x)+0, myAxis(3), myAxis(4)])
set(gca,'Ydir','reverse')
caxis([0 1500]); colormap('jet')
my_handle=colorbar('Position',[0.915 0.125 0.022 0.15], 'ytick',[0:500:1500]);
set(get(my_handle,'Title'),'string','Mag.', 'FontSize', 12);
% colorbar('eastoutside');
set(gca,'ytick',[500 1500 2500 3500]); 
xlabel({'Subcarrier'; '(d)'}, 'FontSize', 12)
ylabel('Packet number', 'FontSize', 12)

% modified line
% manually setting maximum y axis cap due to outliers

% csi_buff_data = csi_buff(:, [5:32 34:61]);
% max_y = max(csi_buff_data(:));
y_max = 1500

for cs = 1:size(csi_buff_,1)
%     csi = csi_buff(cs,:);
    
% modified lines
%     csi = csi(:,[5:61]);
%     csi(29) = 0;
    csi_buff = csi_buff_(:,[5:61]);
    csi_buff(:,29) = 0;
    
    subplot(4,1,1)
    plot(x,csi_buff);
    grid on
    myAxis = axis();
    axis([min(x), max(x), 0, y_max])
    xlabel({'Subcarrier'; '(a)'}, 'FontSize', 12)
    ylabel('Magnitude', 'FontSize', 12)
%     title('Channel State Information')
%     text(max(x),max_y-(0.05*max_y),['Packet #',num2str(cs),' of ',num2str(size(csi_buff,1))],'HorizontalAlignment','right','Color',[0.75 0.75 0.75]);

% modified line
    csi_phase = csi_phase_(:,[5:61]);
    csi_phase(:,29) = 0;
%     csi_phase = csi_phase + 180;
    csi_phase_r = csi_phase*(pi/180);
    csi_phase_r = unwrap(csi_phase_r,[],2);
    
    subplot(4,1,2)
% modified line
%     plot(x,csi_phase(cs,:));
%     mdl = fitlm(x,csi_phase);
    plot(x, csi_phase);
%     plot(mdl);

    grid on
    myAxis = axis();
%     axis([min(x), max(x), -20, 60])
%     set(gca,'ytick',[-20 0 20 40 60]); 
    axis([min(x), max(x), -200, 200])
    set(gca,'ytick',[-180 -90 0 90 180]); 
    xlabel({'Subcarrier'; '(b)'}, 'FontSize', 12)
    ylabel('Phase (deg)', 'FontSize', 12)
%     disp('Press any key to continue..');
%     waitforbuttonpress();
    
    subplot(4,1,3)
% modified line
%     plot(x,csi_phase(cs,:));
%     mdl = fitlm(x,csi_phase);
    plot(x, csi_phase_r);
%     plot(mdl);

    grid on
    myAxis = axis();
    axis([min(x), max(x), -20, 60])
    set(gca,'ytick',[-20  0 20 40 60]); 
%     axis([min(x), max(x), -200, 200])
%     set(gca,'ytick',[-180 -90 0 90 180]); 
    xlabel({'Subcarrier'; '(c)'}, 'FontSize', 12)
    ylabel('Phase (rad)', 'FontSize', 12)
%     disp('Press any key to continue..');
%     waitforbuttonpress();
end
close

end
