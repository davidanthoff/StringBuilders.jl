import * as core from '@actions/core'
import * as exec from '@actions/exec'
import * as tc from '@actions/tool-cache'

import * as os from 'os'
import * as path from 'path'

// Store information about the environment
const osPlat = os.platform() // possible values: win32 (Windows), linux (Linux), darwin (macOS)
core.debug(`platform: ${osPlat}`)

async function run() {
    try {
        // Test if Julia has been installed by showing versioninfo()
        await exec.exec('julia', ['--color=yes', '--project', '-e', 'using Pkg; Pkg.build(); Pkg.test("StringBuilders")'])
    } catch (error) {
        core.setFailed(error.message)
    }
}

run()