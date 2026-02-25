// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %dumpCHIRDebug %enableO2 -Woff all %f -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %output %run_args
// (Linux) EXEC: %cat %n\_CHIR/[0-9]*_Devirtualization.chirtxt | sed -n -r '/Func @_CN7default6<main>Hv/,/^}$/p' | compare %f
// (Linux) ASSERT: regex Invoke.*foo

abstract class A {
    public open func foo(): Unit {}
}

interface I {
}

abstract class B<T> <: A where T <: I {
}

class Item1 <: I {
}

class Item2 <: I {
}

class C <: B<Item1> {
    public override func foo(): Unit {
        print("C::foo");
    }
}

class D <: B<Item2> {
    public override func foo(): Unit {
        print("D::foo");
    }
}

main() {
    var a = C();
    (a as A)?.foo(); // not optimized, but call C::foo
    0
}