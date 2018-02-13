using StringBuilders
using Base.Test

@testset "StringBuilders" begin
    sb = StringBuilder()
    print(sb, "First string.")
    print(sb, "Second string.")
    print(sb, "Third string.")

    s = String(sb)
    @test s == "First string.Second string.Third string."
    s2 = String(sb)
    @test s2 == "First string.Second string.Third string."

    print(sb, "Fourth string.")
    s3 = String(sb)

    @test s3 == "First string.Second string.Third string.Fourth string."

end