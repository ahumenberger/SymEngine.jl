
function linsolve(sys::Vector{Basic}, sym::Vector{Basic})
    csys = convert(CVecBasic, sys)
    csym = convert(CVecBasic, sym)
    csol = CVecBasic()
    ccall((:vecbasic_linsolve, libsymengine), Void, (Ptr{Void}, Ptr{Void}, Ptr{Void}), csys.ptr, csym.ptr, csol.ptr)
    convert(Vector, csol)
end

function solve_poly(p::Basic, x::Basic)
    s = CSetBasic()
    ccall((:basic_solve_poly, libsymengine), Void, (Ptr{Basic}, Ptr{Basic}, Ptr{Void}), &p, &x, s.ptr)
    convert(Vector, s)
end