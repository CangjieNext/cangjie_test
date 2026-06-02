/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.encoding.url.*

main(): Int64 {
    var userinfo1 = UserInfo("ABCD", "efvb")
    var userinfo2 = UserInfo("", "ABc")
    var userinfo3 = UserInfo("Abc", "")
    var userinfo4 = UserInfo("Hl")
    var a = userinfo1.toString()
    var b = userinfo2.toString()
    var c = userinfo3.toString()
    var d = userinfo4.toString()
    if (a != "ABCD:efvb") {
        return 1
    }
    if (b != ":ABc") {
        return 2
    }
    if (c != "Abc") {
        return 3
    }
    if (d != "Hl") {
        return 4
    }
    return 0
}
