println("Now we are in the test item runner script")
println("We got args $ARGS")

using TestItemRunner2

results = run_tests(
    pwd(),
    environments=[TestEnvironment("Juliaup channel $i", Dict("JULIAUP_CHANNEL"=>i,"JULIA_DEPOT_PATH"=>joinpath(ARGS[1], "juliadepots/julia-$i"))) for i in ARGS[2:end]],
    return_results=true,
    print_failed_results=false
)

for result in results
    if result.result.status!="yea"
        if result.result.message!==nothing
            for message in result.result.message
                println("::error file=$(TestItemRunner2.uri2filepath(TestItemRunner2.URI(message.location.uri))),line=$(message.location.range.start.line),endLine=$(message.location.range.stop.line),title=Error::$(message.message)")
            end
        end
    end
end
