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
    var userinfo1 = UserInfo("1a3434434B")
    var userinfo2 = UserInfo("")
    var a = userinfo1.toString()
    var b = userinfo2.toString()
    if (a != "1a3434434B") {
        return 1
    }
    if (b != "") {
        return 1
    }
    return 0
}
