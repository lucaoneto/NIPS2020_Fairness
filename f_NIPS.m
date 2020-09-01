function YF = f_NIPS(YL,YT,SL,ST)
    u = unique(SL);
    [nM, iM] = max([sum(SL==u(1)),sum(SL==u(2))]);
    [nm, im] = min([sum(SL==u(1)),sum(SL==u(2))]);
    p = nm/length(SL);
    q = 1-p;
    YF = zeros(size(YT));
    for i = 1:length(YT)
        if (ST(i) == u(im))
            dist_best = +Inf;
            for t = linspace(min(YL),max(YL),100)
                tmp1 = sum(YL(SL==u(iM)) < t)/nM;
                tmp2 = sum(YL(SL==u(im)) < YT(i))/nm;
                dist = abs(tmp1-tmp2);
                if (dist_best > dist)
                    dist_best = dist;
                    ts = t;
                end
            end
            YF(i) = p*YT(i)+(1-p)*ts;
        else
            dist_best = +Inf;
            for t = linspace(min(YL),max(YL),100)
                tmp1 = sum(YL(SL==u(im)) < t)/nm;
                tmp2 = sum(YL(SL==u(iM)) < YT(i))/nM;
                dist = abs(tmp1-tmp2);
                if (dist_best > dist)
                    dist_best = dist;
                    ts = t;
                end
            end
            YF(i) = q*YT(i)+(1-q)*ts;
        end
    end
end

