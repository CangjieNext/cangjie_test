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

interface I1 {
    mut static prop a1: Int64
    mut static prop a2: Int64 {
        get() {
            a1
        }
        set(v) {}
    }
    mut static prop a3: Int64 {
        get() {
            a2
        }
        set(v) {}
    }
    mut static prop a4: Int64 {
        get() {
            a3
        }
        set(v) {}
    }
    mut static prop a5: Int64 {
        get() {
            a4
        }
        set(v) {}
    }
    mut static prop a6: Int64 {
        get() {
            a5
        }
        set(v) {}
    }
    mut static prop a7: Int64 {
        get() {
            a5 + a6
        }
        set(v) {}
    }
    mut static prop a8: Int64 {
        get() {
            a5 + a6 + a7
        }
        set(v) {}
    }
    mut static prop a9: Int64 {
        get() {
            a5 + a6 + a7 + a8
        }
        set(v) {}
    }
    mut static prop a10: Int64 {
        get() {
            a5 + a6 + a7 + a8 + a9
        }
        set(v) {}
    }
}

interface I2 <: I1 {
    mut static prop a1: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

main(): Int64 {
    return I2.a10
}
