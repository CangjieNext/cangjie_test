// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output %run_args

class C {}

class A<T> where T <: C {
    public var a: T
    public init(b: T) {
        this.a = b
    }
}

type B<T> = A<T>

main() {
    var b = B(C())
}
