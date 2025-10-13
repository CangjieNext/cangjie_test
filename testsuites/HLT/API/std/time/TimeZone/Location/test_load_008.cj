/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) RUN-EXEC-PIPE: %compiler %cmp_opt   %f -o %output
// (not Windows) RUN-EXEC-PIPE: unset TZ && %run %run_opt %output %run_args

import std.time.*
import std.fs.*
import std.convert.*

foreign func CJ_TIME_GetLocalTimeOffset(): Int64

@When[os == "Windows"]
let ID = initLocalDefault()

func initLocalDefault(): String {
    let offset = unsafe { 0 - CJ_TIME_GetLocalTimeOffset() }
    if (offset == 0) {
        return TimeZone.UTC.toString()
    }
    let duration = Duration.minute * offset
    let hour = duration.toHours()
    let minute = duration.abs().toMinutes() % 60
    return "UTC${hour.format("+.2")}:${minute.format(".2")}"
}

@When[os != "Windows"]
let ID = getlocalname()

@When[os != "Windows"]
func getlocalname(): String {
    let path = canonicalize(Path("/etc/localtime")).toString()
    if (let Some(pos) <- path.lastIndexOf("zoneinfo")) {
        var substring = path[(pos + 8)..path.size] // 8 is the size of "zoneinfo"
        if (let Some(pos) <- substring.indexOf("/")) {
            return substring[pos + 1..]
        }
    }
    return "local"
}

class TestParseFormat {
    public func testTimeParse() :Int64{
        let mylocation = "Local"

        var newlocation = TimeZone.load(mylocation)
        var newlocationname = newlocation.toString()

        var res = assertEqual(newlocationname, ID, "Comparing the result of load()\n")
        if (res == false) {
            return 1
        } else {
            return 0
        }
    }
}

func assertEqual(result: String, expected: String, msg: String): Bool {
    if (result != expected) {
        print(msg + "Failure\nexpect: ${expected}\nresult: ${result}\n")
        return false
    }
    return true
}

main(): Int64 {
    let cases: TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
