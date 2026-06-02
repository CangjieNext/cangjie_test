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

extend<T> Array<T> <: I<T> {
    public mut prop pa: Int64 {
        get() {
            this.size
        }
        set(b) {
            this[b] = this[0]
        }
    }
}

interface I<T> {
    mut prop pa: Int64 {
        get() {
            1
        }
        set(b) {
        }
    }
}

main() {
    var c = [1, 2, 3]
    if (c.pa == 3) {
        c.pa = 2
    }
    print(c)
    if (c[0] == 1 && c[1] == 2 && c[2] == 1) {
        return 0
    }
    return 1
}
