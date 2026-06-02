/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public sealed interface I1 {
    func f(): Int64
}

interface I2 <: I1 {
    func f() {
        1
    }
}

class cls <: I2 {}

main(): Int64 {
    if (cls().f() == 1) {
        return 0
    }
    return 1
}
