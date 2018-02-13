# StringBuilders

## Overview

A simple type for building up ``String``s. Use as follows:

````julia
using StringBuilders

sb = StringBuilder()
print(sb, "First string")
print(sb, "Second string")

s = String(sb)
````
