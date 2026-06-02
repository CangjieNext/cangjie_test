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

extend<T> Option<T> <: I<T> {}

interface I<T> {
    static func foo<T>(a: T) {
        return a
    }
}

main() {
    return Option<Int64>.foo(-1) + Option<Int32>.foo<Int64>(1)
}
