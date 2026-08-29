# StringBuilders.jl

StringBuilders.jl provides [`StringBuilder`](@ref), a small mutable type
for building up a `String` from many pieces. It offers a simpler,
higher-level API than working with an `IOBuffer` directly.

## Installation

The package is registered in the General registry:

```julia
using Pkg
Pkg.add("StringBuilders")
```

## Usage

Create a builder, `append!` strings to it, and convert it to a `String`
when you are done:

```jldoctest
julia> using StringBuilders

julia> sb = StringBuilder();

julia> append!(sb, "First string. ");

julia> append!(sb, "Second string.");

julia> String(sb)
"First string. Second string."
```

`append!` accepts any number of strings at once:

```jldoctest
julia> using StringBuilders

julia> sb = StringBuilder();

julia> append!(sb, "a", "b", "c");

julia> String(sb)
"abc"
```

Any `AbstractString` can be appended, not just `String`:

```jldoctest
julia> using StringBuilders

julia> sb = StringBuilder();

julia> append!(sb, SubString("hello world", 7), "!");

julia> String(sb)
"world!"
```

### Reading the result does not reset the builder

Unlike `take!` on an `IOBuffer`, calling `String` on a builder does not
empty it. The result is cached, so `String(sb)` can be called as often as
you like, and further `append!` calls continue from the existing content:

```jldoctest
julia> using StringBuilders

julia> sb = StringBuilder();

julia> append!(sb, "abc");

julia> String(sb)
"abc"

julia> String(sb)
"abc"

julia> append!(sb, "def");

julia> String(sb)
"abcdef"
```

A freshly created builder converts to the empty string:

```jldoctest
julia> using StringBuilders

julia> String(StringBuilder())
""
```

## Comparison with `IOBuffer`

`StringBuilder` is a thin wrapper around an `IOBuffer`, so the two are
functionally equivalent. The difference is purely in the API surface. The
first example above, written with an `IOBuffer`, would be:

```julia
io = IOBuffer()
write(io, "First string. ")
write(io, "Second string.")
s = String(take!(io))
close(io)
```

With `StringBuilder` there is no need to remember `take!`, `close`, or the
difference between `write` and `print`, and the builder stays usable after
its content has been read.

## API reference

```@docs
StringBuilders
StringBuilder
String(::StringBuilder)
append!(::StringBuilder, ::AbstractString)
```
