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

// let
open class A {
    public open prop i: Int64 {
        get() {
            return 0
        }
    }
}

class B <: A {
    public override prop i: Int64 {
        get() {
            return 1
        }
    }
}

main(): Int64 {
    if (B().i != 1) {
        return 1
    }
    if (A().i != 1) {
        return 0
    }
    return 0
}
