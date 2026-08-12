/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./jsonChecker
// EXEC: %compiler    %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan error31

package std.unittest.test

import std.fs.*
import std.unittest.common.*

main() {
    var num: Int64 = 0
    for (i in 1..32) {
        var s = File.readFrom("./jsonChecker/fail" + i.toString() + ".json")
        var str = String.fromUtf8(s)
        try {
            var jv: JsonValue = JsonValue.fromStr(str)
        } catch (e: JsonException) {
            if (e.toString().contains("The json data is Non-standard, please check")) {
                num++
            }
            if (e.toString().contains("Json String is empty!")) {
                num++
            }
        }
    }
    println("error${num}")
    0
}
