/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler    %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan test_getValue_ok test_toString_ok test_toJsonString_ok

package std.unittest.test

import std.unittest.common.*

main(): Int64 {
    //init getValue toString toJsonString
    var jsonFloat = JsonFloat(3.14)
    if (jsonFloat.getValue() == 3.140000000) {
        print("test_getValue_ok ")
    }
    if (jsonFloat.toString() == "3.140000") {
        print("test_toString_ok ")
    }
    if (jsonFloat.toJsonString() == "3.140000") {
        print("test_toJsonString_ok")
    }
    return 0
}
