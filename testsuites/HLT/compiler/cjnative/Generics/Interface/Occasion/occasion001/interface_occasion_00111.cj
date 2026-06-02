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
interface I<T> {
    static func foo(a: T): T {
        return a
    }
}

class Test<T> <: I<T> {}

main() {
    if (Test<Int32>.foo(Int32(1)) != Int32(1)) {
        return 1
    }
    return 0
}
