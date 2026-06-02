/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class C<T> where T <: ToString {
    init(a: T) {
    }

    func toString() {
        ""
    }
}

main(): Int64 {
    let f = {a => C<Int32>(a)}
    if (f is (Int32) -> C<Int32>) {
        return 0
    }
    return 1
}
