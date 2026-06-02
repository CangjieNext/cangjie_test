/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass01 pass02 pass03 pass04 pass05
import stdx.encoding.json.*

main() {
    var jv01: JsonValue = JsonNull()
    var jv02: JsonValue = JsonBool(true)
    var jv03: JsonValue = JsonInt(250)
    var jv04: JsonValue = JsonFloat(250.250)
    var jv05: JsonValue = JsonString("test JsonString!")
    if (jv01.toString() == "null") {
        print("pass01 ")
    }
    if (jv02.toString() == "true") {
        print("pass02 ")
    }
    if (jv03.toString() == "250") {
        print("pass03 ")
    }
    if (jv04.toString() == "250.250000") {
        print("pass04 ")
    }
    if (jv05.toString() == "\"test JsonString!\"") {
        print("pass05 ")
    }
    0
}
