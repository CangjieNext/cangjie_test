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

open class A {
    public open prop v: Int64 {
        get() {
            return 1
        }
    }
}

class B <: A {
    public override prop v: Int64 {
        get() {
            return v + 1
        }
    }
}

main(): Int64 {
    A()
    B()
    return 0
}
