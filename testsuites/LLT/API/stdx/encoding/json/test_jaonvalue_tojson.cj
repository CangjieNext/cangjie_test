/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan 1 [-1] -1 1.830000 null true false "hjkeh\\ndhsdf"
import stdx.encoding.json.*

main() {
    var jv01 = JsonValue.fromStr("1")
    print(jv01.toString() + " ")
    var jv02 = JsonValue.fromStr("[-1]")
    print(jv02.toString() + " ")
    var jv03 = JsonValue.fromStr("-1")
    print(jv03.toString() + " ")
    var jv04 = JsonValue.fromStr("1.83")
    print(jv04.toString() + " ")
    var jv05 = JsonValue.fromStr("null")
    print(jv05.toString() + " ")
    var jv06 = JsonValue.fromStr("true")
    print(jv06.toString() + " ")
    var jv07 = JsonValue.fromStr("false")
    print(jv07.toString() + " ")
    var jv08 = JsonValue.fromStr("\"hjkeh\\ndhsdf\"")
    print(jv08.toString())
    0
}
