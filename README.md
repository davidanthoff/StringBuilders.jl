# StringBuilders

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/davidanthoff/StringBuilders.jl.svg?branch=master)](https://travis-ci.org/davidanthoff/StringBuilders.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/sq0vldeasb7onq0h/branch/master?svg=true)](https://ci.appveyor.com/project/davidanthoff/stringbuilders-jl/branch/master)
[![StringBuilders](http://pkg.julialang.org/badges/StringBuilders_0.6.svg)](http://pkg.julialang.org/?pkg=StringBuilders)
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
