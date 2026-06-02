/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Aoo<T> where T <: A & B {
    public var a: T
    public init(x: T) {
        a = x
    }
}

open class A {}

class B {
    public func foo() {}
}

main() {
    var a = Aoo<B>(B())
    if (a.a.foo() != ()) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_multiple_class_upperbounds
// ASSERT: scan sema_generic_type_argument_not_match_constraint
