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
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs.classImport08 as class08

extend class08 {
    public func foo2() {
        return true
    }

    public func foo3() {
        return 8
    }
}

main(): Int64 {
    if (class08().foo2()) {
        return class08().foo() - class08().foo3()
    } else {
        return 1
    }
}
