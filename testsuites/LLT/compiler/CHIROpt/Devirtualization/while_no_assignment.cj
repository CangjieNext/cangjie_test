// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7default1BE&->@_CN7default1B3FooHv
// ASSERT: scan-not Invoke(Class-_CN7default1BE&->@_CN7default1B3FooHv

open class A {
    public open func Foo() {
        return 1
    }
}

open class B <: A {
    public override func Foo() {
        return 3
    }
}

open class C <: A {
    public override func Foo() {
        return 4
    }
}

open class C1 <: A {
    public override func Foo() {
        return 5
    }
}

open class C2 <: A {
    public override func Foo() {
        return 6
    }
}

open class C3 <: A {
    public override func Foo() {
        return 7
    }
}

main() {
    var a: A = B();
    var i = 0;
    var size = 0
    while (i < 100) {
        let r = a.Foo();
        size = size + r
        i++;
    }
    return size - 300
}
