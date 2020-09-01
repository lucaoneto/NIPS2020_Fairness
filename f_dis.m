function Yd = f_dis(Y,L)
    Yd = (discretize(Y,[linspace(0,1,L)-(1/(2*(L-1))),1])-1)/(L-1);
end

