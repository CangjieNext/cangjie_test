/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: module037001
// EXEC: %compiler %cmp_opt %compile_lib_opt module037001/src/pkgs037001a/pkgs037001a.cj -o module037001/pkgs037001a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt module037001/src/pkgs037001b/pkgs037001b.cj -o module037001/pkgs037001b.%middle
// EXEC: %compiler %cmp_opt  %f module037001/pkgs037001a.%middle module037001/pkgs037001b.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import module037001.{pkgs037001a, pkgs037001b}

main(): Int64 {
    let a = pkgs037001a.one
    let b = pkgs037001b.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
