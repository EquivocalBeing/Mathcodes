function root = secant_gpt(f, x0, x1, tol, maxIter)

    for k = 1:maxIter
        x2 = x1 - f(x1)*(x1 - x0)/(f(x1) - f(x0));

        if abs(x2 - x1) < tol
            root = x2;
            return
        end

        x0 = x1;
        x1 = x2;
    end

    root = x1;
end
