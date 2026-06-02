// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %noColor %f %diag_json -o %output 2>&1 | compare %f

class C {}

class A<T, U> where T <: C {
    public var a: T
    public var d: U
    public init(b: T, c: U) {
        this.a = b
        this.d = c
    }
}

type B<T> = A<T, Int32>

main() {
    var b = B(C(), C())
}
// ASSERT: scan sema_unable_to_infer_generic_func
