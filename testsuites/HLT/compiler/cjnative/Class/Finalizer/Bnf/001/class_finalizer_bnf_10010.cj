/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
import std.runtime.*

var flag: B = B()

open class B {
    public func foo() {
        this
    }
    public open func x() {
        1
    }
}

class A <: B {
    ~init() {
        flag = super.foo()
    }
    public override func x() {
        2
    }
}

func test() {
    var a = A()
}

main() {
    print("${flag.x()}\n")
    test()
    GC()
    print("${flag.x()}\n")
    return 0
}
// ASSERT: scan sema_capture_this_or_instance_field_in_func
// ASSERT: scan sema_instance_func_cannot_be_used_in_finalizer
