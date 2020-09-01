function err = f_err(YT,YF)
    err = mean((YT-YF).^2);
end

