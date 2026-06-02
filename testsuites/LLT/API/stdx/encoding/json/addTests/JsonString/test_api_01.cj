/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %stdx-package   -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass1 pass2 pass3

import stdx.encoding.json.*

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
