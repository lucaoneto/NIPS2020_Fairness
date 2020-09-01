function lambda = f_lambda(Y,S,M,L,beta)
    lambda = zeros(2*L+1,1);
    fun = @(lambda) f_mincon(lambda,Y,S,M,L,beta);
    options = optimoptions('fmincon','Display','off','OptimalityTolerance',1e-4);
    [lambda,fval,exitflag,output] ...
        = fmincon(fun,lambda,[],[],[],[], ...
        zeros(size(lambda)),4*M*ones(size(lambda)),[],options); %#ok<ASGLU>
end

