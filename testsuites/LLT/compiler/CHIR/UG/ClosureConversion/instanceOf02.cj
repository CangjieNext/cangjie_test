// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

open class A1 {}

open class A2 <: A1 {}

open class A3 <: A2 {}

func to<T>(input: T) {
    return input
}

main() {
    let a13 = {a: A1 => A3()}
    try {
        if (to<(A2) -> A2>(a13) is (A1) -> A3) {
            return 0
        }
    } finally {}
    return 1
}
