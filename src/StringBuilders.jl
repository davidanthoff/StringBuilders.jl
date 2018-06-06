module StringBuilders

export StringBuilder

mutable struct StringBuilder
    buffer::IOBuffer
    as_string::Nullable{String}

    function StringBuilder()
        return new(IOBuffer(), Nullable{String}())
    end
end

function Base.String(sb::StringBuilder)
    if isnull(sb.as_string)
        sb.as_string = Nullable(String(take!(sb.buffer)))
    end
    return get(sb.as_string)
end

function Base.append!(sb::StringBuilder, s::AbstractString)
    if !isnull(sb.as_string)
        print(sb.buffer, get(sb.as_string))
        sb.as_string = Nullable{String}()
    end
    print(sb.buffer, s)
end

function Base.append!(sb::StringBuilder, ss::AbstractString...)
    for s in ss
        append!(sb, s)
    end
end

end # module
