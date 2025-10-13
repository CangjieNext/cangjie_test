// LEVEL: 0
// EXEC: %compiler %cmp_opt %debugCHIROpt %n.cj -o %output
// EXEC: %run %output 2>&1 | compare %f
// ASSERT: scan Two

public class A<T> {
    let box: Box<Option<T>> = Box(Option<T>.None)
    public func foo() {
        if (let Option.Some(_) <- this.box.value) {
            println("One")
        } else {
            println("Two")
        }
    }
}

main() {
    var a = A<Int64>()
    a.foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
