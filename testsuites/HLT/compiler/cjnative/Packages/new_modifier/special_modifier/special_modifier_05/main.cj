/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: A
// EXEC:  %compiler %cmp_opt %compile_lib_opt A/A.cj -o a.%middle 
// EXEC:  %compiler %cmp_opt  a.%middle %f -o %output
// RUN-EXEC:  %run %run_opt %output %run_args

import A.A_a
import A.NA

main() {
    var res = A_a(1).a + NA(1).a - 2
    return res
}
