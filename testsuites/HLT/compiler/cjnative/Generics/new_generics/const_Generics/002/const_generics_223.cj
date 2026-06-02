/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class C1<T> {
    let a: Int64
    let b: ?T
    const init(input: T) {
        this.a = 0
        this.b = input
    }
}

class C2<T> <: C1<T> {
    let c: T
    const init(input: T) {
        super(input)
        this.c = input
    }
}

main() {
    const c1 = C1<Int64>(100)
    const c2 = C2<Int64>(-1)
    if (c1.b == 100 && c2.a == 0 && c2.b == -1 && c2.c == -1) {
        return 0
    }
    return 1
}
