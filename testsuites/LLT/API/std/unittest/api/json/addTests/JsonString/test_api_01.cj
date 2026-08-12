/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler    %cmp_opt    -o %n.%suffix %f
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass1 pass2 pass3

package std.unittest.test

import std.unittest.common.*

main(): Int64 {
    var jsonString = JsonString("nihao")
    if (jsonString.getValue() == "nihao") {
        print("pass1 ")
    }
    if (jsonString.toString() == "\"nihao\"") {
        print("pass2 ")
    }
    if (jsonString.toJsonString() == "\"nihao\"") {
        print("pass3")
    }
    return 0
}
