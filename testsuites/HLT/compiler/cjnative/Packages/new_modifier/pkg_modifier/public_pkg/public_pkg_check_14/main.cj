/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: A
// EXEC:  %compiler %cmp_opt %compile_lib_opt ./A/A1/a/a.cj -o b.%middle
// EXEC:  %compiler %cmp_opt %compile_lib_opt b.%middle ./A/A1/A1.cj -o a.%middle

// EXEC:  %compiler %cmp_opt a.%middle b.%middle %f -o %output
// RUN-EXEC:  %run %run_opt %output %run_args

import A.A1.*

main() {
    return temp_A_a - 1
}
