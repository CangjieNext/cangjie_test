/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  module031001
// EXEC: %compiler %cmp_opt %compile_lib_opt module031001/src/pkgs031001a/pkgs031001a.cj -o module031001/pkgs031001a.%middle 
// EXEC: %compiler %cmp_opt %f module031001/pkgs031001a.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import module031001.pkgs031001a as alias031001

main(): Int64 {
    let a = alias031001.one
    let b = alias031001.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
