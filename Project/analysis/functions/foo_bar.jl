# Updated on: 2024-01-27


"""
    Inputs: X = 2 element vector
    
    Of a Rosenbrock function
"""
f(x) = (1.0 - x[1])^2 + 100.0 * (x[2] - x[1]^2)^2

"""
    Inputs: f = mathematical function
            θ = initial function guess
    
    This function finds the root given a guess
"""
function foo2(f, θ0)
    opt_results = optimize(f, θ0)
    println(opt_results)
    opt_results.minimizer
end
