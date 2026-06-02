/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: multi_str_macro.cj
// EXEC: %compiler %cmp_macro multi_str_macro.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

import mytest.*

func getX(): Option<UInt64> {
    return Some(1)
}

@MSTR(
   func dsu_main(): Int64 {
    println("after:${getX()??10}")
    return 0
}
)

main() {
    0
}
