function root = newton(f, df, x0, tol, n)

    x = x0;
    n_i = 0;

    while n_i < n

        if abs(df(x)) < tol
            %fprintf('df nears zero')
            break
        end

        x_new = x - f(x)/df(x);
        n_i = n_i + 1;

        if abs(x_new - x) < tol
            root = x_new;
            return
        end

        x = x_new;
    end
    root = x;
end
