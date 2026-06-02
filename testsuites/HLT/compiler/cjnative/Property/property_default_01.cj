/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var b = Coo()
    if (b.m != 1) {
        return 1
    }
    if (b.n != 2) {
        return 1
    }
    return 0
}

interface Boo {
    mut prop m: Int64 {
        get() {
            1 // retrun 1
        }
        set(input) {
            () // return ()
        }
    }
    prop n: Int32 {
        get() {
            return 2
        }
    }
}

class Coo <: Boo {}
