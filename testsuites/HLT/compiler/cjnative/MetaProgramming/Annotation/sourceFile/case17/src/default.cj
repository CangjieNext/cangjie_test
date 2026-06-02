/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./mod1/src/p1/*.cj --module-name mod1 -o mod1/a.%middle
// EXEC: %compiler %cmp_opt mod1/a.%middle  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import mod1.p1.*

main(): Int64 {
    if (fileName != "a.cj") {
        return 1
    }
    return 0
}
