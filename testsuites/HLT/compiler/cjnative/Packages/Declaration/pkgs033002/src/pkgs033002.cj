/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  module033002
// EXEC: %compiler %cmp_opt %compile_lib_opt module033002/src/pkgs033002a/pkgs033002a.cj -o module033002/pkgs033002a.%middle
// EXEC: %compiler %cmp_opt %f module033002/pkgs033002a.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import module033002.pkgs033002a.two

main(): Int64 {
    let b = two
    if (b != 2) {
        return 1
    }
    return 0
}
