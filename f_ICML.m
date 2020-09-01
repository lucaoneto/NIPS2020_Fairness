function YTd = f_ICML(YL,YT,SL,ST,L,beta)
    YL = YL*2-1;
    YT = YT*2-1;
    M = 1;
    L = floor(L/2);
    p = [mean(SL==0); mean(SL==1)];
    lambda = f_lambda(YL,SL,M,L,beta);
    YTd = zeros(size(YT));
    i = (-L:1:L)';
    for k = 1:length(YT)
        v = p(ST(k)+1)*(YT(k)-i*M/L).^2+(1-2*ST(k))*lambda;
        [~, j] = min(v);
        YTd(k) = i(j)*M/L;
    end
    YTd = (YTd+1)/2;
end

