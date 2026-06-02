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

interface I<T> {}

class A<T> <: I<A<T>> {
    var a = 2
}

extend String <: I<String> {}

extend Int64 {
    func f<T>(a: T, b!: Int64 = 0) where T <: I<T> {
        return 3
    }
    private func f(a: String, b: String) {
        return 2
    }
}

main(): Int64 {
    return 1.f<A<String>>(A<String>()) + 1.f(" ") - 6;
}
