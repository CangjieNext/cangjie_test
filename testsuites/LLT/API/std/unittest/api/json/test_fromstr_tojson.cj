/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler    %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass01 pass02
package std.unittest.test

import std.unittest.common.*

main() {
    var str01 = JsonValue.fromStr("[\"a\", \"b\"]").toString()
    var res01 = ##"["a","b"]"##
    var str02 = JsonValue.fromStr("[\"a\", \"b\"]").toJsonString()
    var res02 = "[\n  \"a\",\n  \"b\"\n]"
    if (str01 == res01) {
        print("pass01 ")
    } else {
        print("fail01 ")
    }
    if (str02 == res02) {
        print("pass02")
    } else {
        print("fail02")
    }
    0
}
