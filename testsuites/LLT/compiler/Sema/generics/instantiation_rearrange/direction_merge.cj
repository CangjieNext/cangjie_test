// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DT point#5 extend default-conflict resolution (direction pick).
// When multiple extends provide same-named default implementations for different interfaces
// of the same base type, MergeExtendSuperMember uses IsImplementedInSameDirection to decide
// the subclass direction (leaf is-a root), keeping the more specific (sub-interface) version
// and skipping the broader one.
// This case: I2 <: I1, two extends make the base type implement I1.foo and I2.foo (different
// directions); assert the more specific I2 version wins (outputs "I2 wins"), not the I1 one.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan I2 wins
// ASSERT: scan-not I1 wins

interface I1 {
    func foo() {
        println("I1 wins")
    }
}

interface I2 <: I1 {
    func foo() {
        println("I2 wins")
    }
}

class Base {}

// Two extends implement different interfaces; the direction pick keeps the more specific I2 version.
extend Base <: I1 {}
extend Base <: I2 {}

func dispatch<T>(x: T) where T <: I1 {
    x.foo()
}

main() {
    dispatch(Base())
    0
}
