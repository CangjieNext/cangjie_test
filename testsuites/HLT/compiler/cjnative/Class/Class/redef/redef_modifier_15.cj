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

main(): Int64 {
    return Coo.a - 2
}

interface Boo {
    mut static prop a: Int64 {
        get() {
            return 1
        }
        set(v) {}
    }
}

class Coo <: Boo {
    public mut static redef prop a: Int64 {
        get() {
            return 2
        }
        set(v) {}
    }
}
