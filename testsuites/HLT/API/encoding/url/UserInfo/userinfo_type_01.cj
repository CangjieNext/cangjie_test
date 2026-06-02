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
    var userinfo1 = UserInfo("132131", "78786")
    var userinfo2 = UserInfo("", "435453")
    var userinfo3 = UserInfo("2432324", "")
    var userinfo4 = UserInfo("4")
    var a = userinfo1.toString()
    var b = userinfo2.toString()
    var c = userinfo3.toString()
    var d = userinfo4.toString()
    if (a != "132131:78786") {
        return 1
    }
    if (b != ":435453") {
        return 2
    }
    if (c != "2432324") {
        return 3
    }
    if (d != "4") {
        return 4
    }
    return 0
}
