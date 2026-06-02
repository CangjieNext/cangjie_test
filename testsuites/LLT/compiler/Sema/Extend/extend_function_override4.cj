// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %diag_json %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: scan sema_extend_function_cannot_overridden

main(): Int64 {
    var a = B<Int32>().foo()
    return 0
}

open class A<T> {}

extend<T> A<T> {
    public func foo() {
        0
    }
}

class B<T> <: A<T> {
    public override func foo() {
        1
    }
}
