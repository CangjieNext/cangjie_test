// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %diag_json %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan sema_ambiguous_match

open class A {
    public open func f<T>(x: Int, y: T) {}
}

class B <: A {
    public func f<T>(x: T, y: Int) {}
}

main() {
    let b = B()
    b.f(1, 1)
}
