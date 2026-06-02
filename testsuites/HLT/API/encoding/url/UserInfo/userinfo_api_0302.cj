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
    var userinfo1 = UserInfo("123")
    var password1 = userinfo1.password()
    if (case01(password1) != "No") {
        return 1
    }
    return 0
}

func case01(a: Option<String>) {
    return match (a) {
        case Some(y) => y
        case None => "No"
    }
}
