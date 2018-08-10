module StringBuilders

export StringBuilder

mutable struct StringBuilder
    buffer::IOBuffer
    as_string::Union{String,Nothing}

    function StringBuilder()
        return new(IOBuffer(), nothing)
    end
end

function Base.String(sb::StringBuilder)
    if sb.as_string===nothing
        sb.as_string = String(take!(sb.buffer))
    end
    return sb.as_string
end

function Base.append!(sb::StringBuilder, s::AbstractString)
    if sb.as_string!==nothing
        print(sb.buffer, sb.as_string)
        sb.as_string = nothing
    end
    print(sb.buffer, s)
end

function Base.append!(sb::StringBuilder, ss::AbstractString...)
    for s in ss
        append!(sb, s)
    end
end

end # module
