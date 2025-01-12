
@testitem "StringBuilders" begin
    sb = StringBuilder()
    append!(sb, "First string.")
    append!(sb, "Second string.")
    append!(sb, "Third string.")

    s = String(sb)
    @test s == "First string.Second string.Third string."
    s2 = String(sb)
    @test s2 == "First string.Second string.Third string."

    append!(sb, "Fourth string.")
    s3 = String(sb)

    @test s3 == "First string.Second string.Third string.Fourth string."

    b = StringBuilder()
    append!(b, "1", "2", "3")
    @test String(b) == "123"

    sb = StringBuilder()
    @test isempty(String(sb))
end

@testitem "failure testitem" begin
    a = "Hello"
    @test a == "Foo"
end

@testitem "error testitem" begin
    error("This is a real error")
end

@testitem "error in test" begin
    @test error("Error inside test")
end
