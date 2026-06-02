/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output

// RUN-EXEC-3: %run %run_opt %output %run_args

interface I1 {
    mut static prop a: Int64 {
        get() {
            1
        }
        set(v) {}
    }
    mut static prop b: Int64 {
        get() {
            a
        }
        set(v) {}
    }
}

interface I2 <: I1 {
    mut static prop a: Int64 {
        get() {
            2
        }
        set(v) {}
    }
}

open class A <: I2 {
    public mut static prop a: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

class B <: A {
    public mut static prop a: Int64 {
        get() {
            3
        }
        set(v) {}
    }
}

main(): Int64 {
    return B.b
}
