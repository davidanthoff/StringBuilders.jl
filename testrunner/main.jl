println("Now we are in the test item runner script")
println("We got args $ARGS")

using TestItemRunner2

function esc_data(s)
    s = replace(s, '%' => "%25")
    s = replace(s, '\r' => "%0D")
    s = replace(s, '\n' => "%0A")
    return s
end

results = run_tests(
    pwd(),
    environments=[TestEnvironment("Juliaup channel $i", Dict("JULIAUP_CHANNEL"=>i,"JULIA_DEPOT_PATH"=>joinpath(ARGS[1], "juliadepots/julia-$i"))) for i in ARGS[2:end]],
    return_results=true,
    print_failed_results=false
)

at_least_one_fail = false

for result in results
    if result.result.status!="passed"
        global at_least_one_fail = true
        for message in result.result.message
            println("::error file=$(TestItemRunner2.uri2filepath(TestItemRunner2.URI(message.location.uri))),line=$(message.location.range.start.line+1),endLine=$(message.location.range.stop.line+1),title=Test failure::$(esc_data(message.message))")
        end
    end
end

if at_least_one_fail
    exit(1)
end
