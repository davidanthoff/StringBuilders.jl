"""
    StringBuilders

A small package providing [`StringBuilder`](@ref), a mutable type for
incrementally building up a `String` from many pieces.

```julia
using StringBuilders

sb = StringBuilder()
append!(sb, "Hello, ")
append!(sb, "world", "!")
String(sb) # "Hello, world!"
```
"""
module StringBuilders

export StringBuilder

"""
    StringBuilder()

Create an empty string builder.

A `StringBuilder` accumulates strings appended via [`append!`](@ref) and
produces the concatenated result via [`String`](@ref). It is a thin,
higher-level wrapper around an `IOBuffer`.

Converting a builder to a `String` does not reset it: the result is cached,
`String(sb)` can be called repeatedly, and further calls to `append!`
continue where the previous content left off.

# Examples
```jldoctest
julia> using StringBuilders

julia> sb = StringBuilder();

julia> append!(sb, "First string.");

julia> append!(sb, "Second string.");

julia> String(sb)
"First string.Second string."

julia> append!(sb, "Third string.");

julia> String(sb)
"First string.Second string.Third string."
```
"""
mutable struct StringBuilder
    buffer::IOBuffer
    as_string::Union{String,Nothing}

    function StringBuilder()
        return new(IOBuffer(), nothing)
    end
end

"""
    String(sb::StringBuilder) -> String

Return the concatenation of everything appended to `sb` so far.

The result is cached inside the builder, so calling `String(sb)` repeatedly
is cheap and always returns the same content until the next
[`append!`](@ref). The builder remains usable afterwards.

# Examples
```jldoctest
julia> using StringBuilders

julia> sb = StringBuilder();

julia> String(sb)
""

julia> append!(sb, "abc");

julia> String(sb)
"abc"

julia> String(sb) === String(sb)
true
```
"""
function Base.String(sb::StringBuilder)

    if sb.as_string === nothing
        sb.as_string = String(take!(sb.buffer))
    end

    return sb.as_string
end

"""
    append!(sb::StringBuilder, s::AbstractString)
    append!(sb::StringBuilder, ss::AbstractString...)

Append one or more strings to the end of `sb`, in order.

Any `AbstractString` is accepted (e.g. `String`, `SubString`, `LazyString`).
Nothing is returned; retrieve the accumulated content with
[`String`](@ref).

# Examples
```jldoctest
julia> using StringBuilders

julia> sb = StringBuilder();

julia> append!(sb, "1", "2", "3");

julia> append!(sb, SubString("xyz", 2));

julia> String(sb)
"123yz"
```
"""
function Base.append!(sb::StringBuilder, s::AbstractString)
    if sb.as_string !== nothing
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

function exe1(args)
    println("exe1 called with $args")
end

function exe2(args)
    println("exe2 called with $args")
end

end # module
