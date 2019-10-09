# StringBuilders

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
![](https://github.com/davidanthoff/StringBuilders.jl/workflows/Run%20tests/badge.svg)
[![codecov](https://codecov.io/gh/davidanthoff/StringBuilders.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/davidanthoff/StringBuilders.jl)

## Overview

A simple type for building up ``String``s. Use as follows:

````julia
using StringBuilders

sb = StringBuilder()
append!(sb, "First string")
append!(sb, "Second string")

s = String(sb)
````

The advantage of StringBuilders.jl over using `IOBuffer` is in the API. Some may find The higher-level StringBuilders.jl API easier to use. For comparison, the example above using `IOBuffer` would be

```julia
io = IOBuffer()
write(io, "First string")
write(io, "Second String")
s = String(take!(io))
close(io)
```
