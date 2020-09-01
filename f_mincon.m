function ris = f_mincon(lambda,etaX,S,M,L,beta)
    p = [mean(S == 0); mean(S == 1)];
    ris = 0;
    for s = [0,1]
        for ix = 1:length(etaX)
            if (S(ix) == s)
                tot = 0;
                for i = -L:1:L
                    h = 2*p(s+1)*i*M*etaX(ix)/L-p(s+1)*i^2*M^2/L^2;
                    tot = tot + exp(lambda(i+L+1)*(2*s-1)/beta+h/beta);
                end
                for i = -L:1:L
                    h = 2*p(s+1)*i*M*etaX(ix)/L-p(s+1)*i^2*M^2/L^2;
                    tmp1 = exp(lambda(i+L+1)*(2*s-1)/beta+h/beta)/tot;
                    ris = ris + tmp1*((2*s-1)*lambda(i+L+1)+h-beta*log((2*L+1)*tmp1))/sum(S==s);
                end
            end
        end
    end
end

