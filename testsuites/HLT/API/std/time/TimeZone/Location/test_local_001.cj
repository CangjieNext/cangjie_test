/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: %n.sh
// (not Windows) EXEC-PIPE: %compiler %cmp_opt   %f -o %output
// (not Windows) RUN-EXEC-PIPE: a=`bash %n.sh` && b=`%run %run_opt %output %run_args` && if [ "$a" = "$b" ]; then echo "pass"; else echo "a: ${a} b: ${b}"; fi | compare %f
// (not Windows) ASSERT: scan pass

import std.time.*

class TestParseFormat {
    public func testTimeParse():Int64 {
        var mytime = DateTime.now(timeZone: TimeZone.Local)
        var myzone = (mytime.zoneId, mytime.zoneOffset)
        var myzonename = myzone[0]
        var myzoneoffset = myzone[1].toSeconds().toString()

        print(myzoneoffset)

        return 0
    }
}

main(): Int64 {
    let cases: TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
