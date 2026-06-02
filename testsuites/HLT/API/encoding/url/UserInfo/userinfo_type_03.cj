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
    var userinfo1 = UserInfo("你好", "人民")
    var userinfo2 = UserInfo("", "开心")
    var userinfo3 = UserInfo("愉快", "")
    var userinfo4 = UserInfo("努力")
    var a = userinfo1.toString()
    var b = userinfo2.toString()
    var c = userinfo3.toString()
    var d = userinfo4.toString()
    if (a != "你好:人民") {
        return 1
    }
    if (b != ":开心") {
        return 2
    }
    if (c != "愉快") {
        return 3
    }
    if (d != "努力") {
        return 4
    }
    return 0
}
