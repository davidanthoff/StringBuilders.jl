println("Now we are in the test item runner script")
println("We got args $ARGS")

using TestItemRunner2

run_tests(
    pwd(),
    environments=[TestEnvironment("Juliaup channel $i", Dict("JULIAUP_CHANNEL"=>i,"JULIA_DEPOT_PATH"=>joinpath(ARGS[1], "juliadepots/julia-$i"))) for i in ARGS[2:end]],
    
)
