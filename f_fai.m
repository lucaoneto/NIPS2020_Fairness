function fai = f_fai(Y,S)
%     uv = unique(Y)';
%     fai = 0;
%     for v = uv
%         p0 = mean(Y(S==0) == v);
%         p1 = mean(Y(S==1) == v);
%         fai = fai + abs(p0-p1);
%     end
%     fai = fai/length(uv);
    tt = linspace(min(Y),max(Y),1000);
    vv = unique(S);
    nn = [sum(S==vv(1)),sum(S==vv(2))];
    fai = 0;
    for t = tt
        fai = max(fai,abs(sum(Y(S==vv(1))<=t)/nn(1)-sum(Y(S==vv(2))<=t)/nn(2)));
    end
end