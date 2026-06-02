// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output 
// EXEC: %run %output 2>&1 | compare %f
// ASSERT: scan duration=99ns


class Foo {
    var duration = Duration.nanosecond * (-1)
    func foo(): Unit {
        duration += Duration.nanosecond * 100
    }
}

main(): Unit {
    let foo = Foo()
    foo.foo()
    println("duration=${foo.duration}")
}