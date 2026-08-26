function [path, converged, iters] = newtons_method(f, grad, hess, x0, y0, tol, max_iter)

    pt = [x0; y0];
    path = pt;
    
    for k = 1:max_iter
        g = grad( pt(1), pt(2) );
        g_norm = norm(g);
        
        if g_norm < tol
            converged = true;
            iters = k - 1;
            return;
        end
        

        H = hess( pt(1), pt(2) );
        
        try
            d = H \ (-g);
        catch
            d = -g;
        end
        
        alpha = 1.0;
        c = 1e-4;
        rho = 0.5;
        f_cur = f(pt(1), pt(2));
        
        while f(pt(1) + alpha * d(1), pt(2) + alpha * d(2)) > f_cur + c * alpha * (g' * d)
            alpha = alpha * rho;
            if alpha < 1e-15
                break;
            end
        end
        
        % Update iterate
        pt = pt + alpha * d;
        path = [path, pt];
    end
    
    converged = false;
    iters = max_iter;
end