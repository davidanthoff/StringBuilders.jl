@testmodule Foo begin
    X = "SOME VAlue"
    Y = "LIJ"
end

@testsnippet Bar begin
    x = "Hello world"
end

@testitem "StringBuilders" df setup=[Foo,Bar] begin

    @test x == "Hello world"

    sb = StringBuilder()
    append!(sb, "First string.")
    append!(sb, "Second string.")
    append!(sb, "Third string.")

    s = String(sb)
    @test s == "First string.Second string.Third string."
    s2 = String(sb)
    @test s2 == "First string.Second string.Third string.d"

    append!(sb, "Fourth string.")
    s3 = String(sb)

    @test s3 == "First string.Second string.Third string.Fourth string."

    b = StringBuilder()
    append!(b, "1", "2", "3")
    @test String(b) == "123"

    sb = StringBuilder()
    @test isempty(String(sb))

    @test Foo.X == "SOME VAlue"
end

@testitem "Something" begin
    println("Hello world")

    # error("WOA")
end


@testitem "Somdfasdfething" begin
    
    @test "asdf" == "asdf"
end

@testitem "Huhu" begin
    @test "Hello" == "NO"

    @test "AGAIN" == "WHAT"
end