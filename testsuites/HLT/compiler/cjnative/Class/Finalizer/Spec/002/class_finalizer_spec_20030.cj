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

var flag = 0

func foo(a: A) {}

class A {
    public func test() {
        flag += 1
        this
    }
    ~init() {
        foo(this.test())
    }
}

func test() {
    var a = A()
}

main() {
    test()
    GC()
    sleep(Duration.millisecond * 200)
    print("flag is ${flag}.")
    return 0
}
// ASSERT: scan sema_capture_this_or_instance_field_in_func
// ASSERT: scan sema_instance_func_cannot_be_used_in_finalizer
