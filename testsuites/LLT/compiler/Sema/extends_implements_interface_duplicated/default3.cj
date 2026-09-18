// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output

interface A<T> {
    func foo<T>(a: T): Unit {
        let _ = a
    }
}

interface B <: A<Int64> {}

class C<T> <: B & A<T> {
}

class D <: B & A<Int32> {
}

main() {}
