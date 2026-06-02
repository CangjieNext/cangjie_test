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
    var userinfo1 = UserInfo("\t", "\b")
    var userinfo2 = UserInfo("", "\r\n")
    var userinfo3 = UserInfo("\'\"", "")
    var userinfo4 = UserInfo("\f\v")
    var a = userinfo1.toString()
    var b = userinfo2.toString()
    var c = userinfo3.toString()
    var d = userinfo4.toString()
    if (a != "\t:\b") {
        return 1
    }
    if (b != ":\r\n") {
        return 2
    }
    if (c != "\'\"") {
        return 3
    }
    if (d != "\f\v") {
        return 4
    }
    return 0
}
