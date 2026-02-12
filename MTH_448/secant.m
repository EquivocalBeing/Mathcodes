function root = secant(f, x0, x1, tol, n)

    n_i = 0;

    while n_i < n

        denom = f(x1) - f(x0);

        if abs(denom) < tol
            break

        else
            x2 = x1 - f(x1)*(x1 - x0)/denom;

            n_i = n_i + 1;
    
            if abs(x2 - x1) < tol
                root = x2;
                return
            end
    
            x0 = x1;
            x1 = x2;
            
        end
    end    
    
    root = x1;
end