/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle   -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga.*

class Data <: Base {
    public func foo(): Int64 {
        5
    }
}

main(): Int64 {
    return Int64(Data().foo() - 5)
}
