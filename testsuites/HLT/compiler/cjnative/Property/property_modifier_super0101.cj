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
    public var a: Int64 = 1
    public open prop v: Int64 {
        get() {
            return a
        }
    }
}

class B <: A {
    public override prop v: Int64 {
        get() {
            return super.a + 1
        }
    }
}

class C <: A {
    public override prop v: Int64 {
        get() {
            return a + 1
        }
    }
}

main(): Int64 {
    if (A().v != 1) {
        return 1
    }
    if (B().v != 2) {
        return 2
    }
    if (C().v != 2) {
        return 2
    }
    return 0
}
