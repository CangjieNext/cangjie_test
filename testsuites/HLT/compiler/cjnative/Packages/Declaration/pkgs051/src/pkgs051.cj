/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs

//public let a  : Int32 = pkgs.one
//let a = pkgs.one

main(): Int64 {
    let a = pkgs.one
    if (a != 2) {
        return 1
    }
    return 0
}
