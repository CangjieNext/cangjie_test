/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  module012
// EXEC: %compiler %cmp_opt %compile_lib_opt module012/src/pkgs/pkgs.cj -o module012/  
// EXEC: %compiler %cmp_opt %f module012/libmodule012.pkgs.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import module012.pkgs

main(): Int64 {
    let a = pkgs.one
    let b = pkgs.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
