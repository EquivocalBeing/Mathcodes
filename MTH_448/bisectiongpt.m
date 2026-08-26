function root = bisectiongpt(f, a, b, tol)

    if f(a)*f(b) > 0
        fprintf('\n**Function must change sign on [a,b]**\n\n')
    else
        while (abs(b-a) > tol)
            c = (a + b)/2;

            if abs(f(c)) < tol || abs(b-a)/2 < tol
                root = c;
                return
            end
    
            if f(a)*f(c) < 0
                b = c;
            else
                a = c;
            end
        end
        root = c;
        
    end
end
