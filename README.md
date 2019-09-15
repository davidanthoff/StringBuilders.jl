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
