/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: enum_type_0501a
// EXEC: %compiler %cmp_opt %compile_lib_opt enum_type_0501a/enum_type_0501a.cj -o enum_type_0501a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f enum_type_0501a.%middle -o %n.%suffix 2>&1 | compare %f

import enum_type_0501a.*

func run(): Int64 {
    var time = TimeUnit.Day
    var res: Int32 = match (time) {
        case Year => 0
        case Month => 1
        case Day => 2
        case Hour => 3
    }

    if (res == 2) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_undeclared_identifier
