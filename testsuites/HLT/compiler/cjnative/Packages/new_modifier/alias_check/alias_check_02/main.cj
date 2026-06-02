/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: A
// EXEC:  %compiler %cmp_opt %compile_lib_opt  ./A/b/b.cj -o b.%middle 
// EXEC:  %compiler %cmp_opt %compile_lib_opt  ./A/a/a.cj -o a.%middle

// EXEC:  %compiler %cmp_opt a.%middle b.%middle %f -o %output
// RUN-EXEC:  %run %run_opt %output %run_args

import A.a as aa
import A.b as bb

main() {
    return aa.temp_a + bb.temp_b - 2
}
