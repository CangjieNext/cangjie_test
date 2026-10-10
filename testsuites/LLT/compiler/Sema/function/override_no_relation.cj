// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output

public interface AAA {
    func foo(x: Int64): Int64
}

public interface BBB {
    func foo(x: Int64): Int64
}

func posion<T>(x: T): Int64 where T <: AAA & BBB {
    0
}

public func goo<R>(x: R): Int64 where R <: BBB {
    x.foo(1)
}

main() {}
