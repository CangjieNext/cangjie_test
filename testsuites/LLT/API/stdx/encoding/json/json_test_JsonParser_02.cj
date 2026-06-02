/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass01 pass02
import stdx.encoding.json.*

main() {
    var str01 = "[]"
    var str02 = "{}"
    var jv01: JsonValue = JsonValue.fromStr(str01)
    var jv02: JsonValue = JsonValue.fromStr(str02)
    var res01 = jv01.toString()
    var res02 = jv02.toString()
    if (str01 == res01) {
        print("pass01 ")
    } else {
        print("fail01 ")
    }
    if (str02 == res02) {
        print("pass02 ")
    } else {
        print("fail02 ")
    }
    0
}
