/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  module033001
// EXEC: %compiler %cmp_opt %compile_lib_opt module033001/src/pkgs033001a/pkgs033001a.cj -o module033001/pkgs033001a.%middle
// EXEC: %compiler %cmp_opt %f   module033001/pkgs033001a.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import module033001.pkgs033001a.two as alias033001

main(): Int64 {
    let b = alias033001
    if (b != 2) {
        return 1
    }
    return 0
}
