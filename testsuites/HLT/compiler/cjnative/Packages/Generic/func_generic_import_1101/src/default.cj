/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt a.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.aoo
import p1.boo as B
import p1.A

main(): Int64 {
    var r1 = aoo<Int64>
    return 0
}
