/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./jsonChecker
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass4

import std.fs.*
import stdx.encoding.json.*

main() {
    var num: Int64 = 0
    for (i in 1..5) {
        var s = File.readFrom("./jsonChecker/pass" + i.toString() + ".json")
        var str = String.fromUtf8(s)
        var jv: JsonValue = JsonValue.fromStr(str)
        num++
    }
    sleep(Duration.millisecond * 1)
    println("pass${num}")
    0
}
