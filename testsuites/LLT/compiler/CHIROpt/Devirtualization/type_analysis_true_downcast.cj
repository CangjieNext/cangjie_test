// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Cover ClassStaticCast true downcast: param SUBTYPE_OF(Base) narrowed to SUBTYPE_OF(Child).
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default3useHCNY_4BaseE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan ClassStaticCast(
// ASSERT: scan Apply(Class-_CN7default5ChildE&->@_CN7default5Child3fooHv
// ASSERT: scan Invoke(Class-_CN7default4BaseE&->@_CN7default4Base3fooHv

open class Base {
    public open func foo(): Int64 {
        1
    }
}

class Child <: Base {
    public func foo(): Int64 {
        2
    }
}

func use(b: Base): Int64 {
    if (let Some(c) <- (b as Child)) {
        c.foo()
    } else {
        b.foo()
    }
}

main() {
    use(Child()) + use(Base()) - 3
}
