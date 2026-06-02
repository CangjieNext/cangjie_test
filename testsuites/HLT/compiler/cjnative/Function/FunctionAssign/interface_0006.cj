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

interface R<T> {
    //static
    func funca(a: Int32, b: T): Int32 {
        return a
    }
}

class C<T> <: R<T> {}

let a = C<Bool>().funca

main(): Int64 {
    return Int64(a(3, true) - 3)
}
