/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  module035001
// EXEC: %compiler %cmp_opt %compile_lib_opt module035001/src/pkgs035001a/pkgs035001a.cj -o module035001/pkgs035001a.%middle
// EXEC: %compiler %cmp_opt %f  module035001/pkgs035001a.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import module035001.pkgs035001a

main(): Int64 {
    let a = pkgs035001a.one
    let b = pkgs035001a.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
