using TestItemRunner2, JSON

function esc_data(s)
    s = replace(s, '%' => "%25")
    s = replace(s, '\r' => "%0D")
    s = replace(s, '\n' => "%0A")
    return s
end

results = run_tests(
    pwd(),
    environments=[TestEnvironment("Julia $i", true, Dict("JULIAUP_CHANNEL"=>i,"JULIA_DEPOT_PATH"=>joinpath(ARGS[1], "juliadepots/julia-$i"))) for i in ARGS[2:end]],
    fail_on_detection_error=false,
    return_results=true,
    print_failed_results=false,
    progress_ui=:log    
)

at_least_one_fail = false

for te in results.definition_errors
    global at_least_one_fail = true
    println()
    println("::error file=$(TestItemRunner2.uri2filepath(TestItemRunner2.URI(te.uri))),line=$(te.line),title=Test definition error::$(esc_data(te.message))")
end

for result in results.test_results
    if result.result.status!="passed"
        global at_least_one_fail = true
        for message in result.result.message
            println()
            println("::error file=$(TestItemRunner2.uri2filepath(TestItemRunner2.URI(message.location.uri))),line=$(message.location.range.start.line),endLine=$(message.location.range.stop.line),title=Test failure on $(result.testenvironment.name)::$(esc_data(message.message))")
        end
    end
end

open(ENV["GITHUB_STEP_SUMMARY"], "w") do f
    println(f, "# Test summary from David")
end

if at_least_one_fail
    exit(1)
end
