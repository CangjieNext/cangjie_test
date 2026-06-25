// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %compile_lib_opt %f -o %output

public func foo<T, R>(transform: (T) -> R): (T) -> Int64 {
    return {it: T => 0}
}

public class ClassA<T> {
    public func foo<R>(transform: (T) -> R): Int64 {
        0
    }
}

extend<T> ClassA<T> {
    func f(it: T): Int64 {
        return it |> foo {_ => 0}
    }
    func g(it: T): Int64 {
        return foo {_ => 0}(it)
    }
}
