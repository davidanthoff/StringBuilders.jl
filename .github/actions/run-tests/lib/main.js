"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const core = require("@actions/core");
const exec = require("@actions/exec");
const os = require("os");
// Store information about the environment
const osPlat = os.platform(); // possible values: win32 (Windows), linux (Linux), darwin (macOS)
core.debug(`platform: ${osPlat}`);
function run() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            // Test if Julia has been installed by showing versioninfo()
            yield exec.exec('julia', ['--color=yes', '--project', '-e', 'using Pkg; Pkg.build(); Pkg.test("StringBuilders")']);
        }
        catch (error) {
            core.setFailed(error.message);
        }
    });
}
run();
