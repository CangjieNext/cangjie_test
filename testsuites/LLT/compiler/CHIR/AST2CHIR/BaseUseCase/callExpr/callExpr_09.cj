// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt -Woff all %n.cj
// RUN-EXEC-PIPE-0: %run main | compare %f
// EXEC: %compiler %cmp_opt %enableO2 -Woff all %n.cj
// RUN-EXEC-PIPE-0: %run main | compare %f
// ASSERT: scan-2 b

open class Foo {}

open class A {
    public open func test<T>(x: Int64): Int64 {
        println("a");
        1
    }
}

open class B <: A {
    public open func test<Y>(x: Y): Y {
        println("b");
        x
    }
}

open class C {
    public open func test<T>(x: Foo): Unit {
        println("a");
    }
}

open class D <: C {
    public open func test<Y>(x: Y): Unit {
        println("b");
    }
}

main() {
    let _ = B().test(0)
    D().test(Foo())
}
