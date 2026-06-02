/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f %macro_debug -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

package use

import define.*

interface A {
    @M1
    mut prop a: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

class B {
    @M1
    public mut prop a: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

struct C {
    @M1
    public mut prop a: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

enum D {
    e

    @M1
    public prop a: Int64 {
        get() {
            1
        }
    }
}

main() {
    0
}
