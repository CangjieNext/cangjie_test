// EXEC-PIPE-0: %compiler %debugCHIROpt %enableFuncInlining %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to get at [36,4] was optimized.
// ASSERT: scan [Devirtualization] The function call to get at [40,4] was optimized.
// ASSERT: scan [Devirtualization] The function call to get at [42,4] was optimized.

interface A {
    func get(): Unit
}

class B <: A {
    public open func get() {
    }
}

class D <: A {
    public func get() {
    }
}

class TestGet {
public var success: B = B()
}

func foo(): A {
    let a = TestGet()
    return a.success
}

func foo2(a: A) {
    a.get()
}

main() {
   let a = foo()
   a.get()

   let t = TestGet()
   var a1:A = t.success
   a1.get()

   foo2(t.success)
   0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
