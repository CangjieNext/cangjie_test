/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

var x = A()

open class A {}

class B <: A {
    ~init() {
        x = foo()
    }
}

extend A {
    public func foo() {
        this
    }
}

func test() {
    var a = A()
}

main() {
    test()
    return 0
}
// ASSERT: scan sema_instance_func_cannot_be_used_in_finalizer
