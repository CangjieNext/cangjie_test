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

enum A<T> {
    EA(T)
    | EB(Int64, T)
}

extend<T> A<T> {
    func foo(a: T) {
        return a
    }

    func foob() {
        match (this) {
            case EA(a) => a
            case EB(a, b) => b
        }
    }
}

main() {
    return A<Int64>.EB(1, 1).foo(1) + A<Int64>.EA(-1).foob()
}
