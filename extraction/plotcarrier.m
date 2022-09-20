clear all
% FILE = './ref_204_1_3500.pcap'
FILE = './test_204_1_100.pcap'
CHIP = '43455c0';
BW = 20;                % bandwidth 
NPKTS_MAX = 3500;

%% read file
HOFFSET = 16;           % header offset
NFFT = BW*3.2;
p = readpcap();
p.open(FILE);
n = min(length(p.all()), NPKTS_MAX);
p.from_start();
csi_buff = complex(zeros(n,NFFT),0);

k = 1;
while (k <= n)
    f = p.next();
    if isempty(f)
        disp('no more frames');
        break;
    end
    if f.header.orig_len-(HOFFSET-1)*4 ~= NFFT*4
        disp('skipped frame with incorrect size');
        continue;
    end
    payload = f.payload;
    H = payload(HOFFSET:HOFFSET+NFFT-1);
    Hout = typecast(H, 'int16');
    Hout = reshape(Hout,2,[]).';
    cmplx = double(Hout(1:NFFT,1))+1j*double(Hout(1:NFFT,2));
    csi_buff(k,:) = cmplx.'; % fill buffer each time with a new packet
    k = k + 1;
end

plotcsi(csi_buff, NFFT, true)
