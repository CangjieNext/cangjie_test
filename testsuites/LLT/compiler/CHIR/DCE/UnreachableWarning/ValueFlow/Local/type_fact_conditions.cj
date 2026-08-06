// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Concrete type facts propagate, while open-hierarchy and runtime conversions do not.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_block_in_expression"

open class Base {}

class Derived <: Base {}

class OtherDerived <: Base {}

func concreteTypeChecks() {
    let derived = Derived()
    if (derived is Base) {
        println("reachable supertype check")
    } else {
        println("unreachable supertype else")
    }

    if (derived is OtherDerived) {
        println("unreachable sibling type check")
    }
}

func checkOpenHierarchy(value: Base) {
    if (value is Derived) {
        println("not inferred unreachable")
    }
}

func checkRuntimeConversion() {
    let base: Any = 1
    let converted = base as String
    if (let value <- converted) {
        println(value)
    }
}

main() {
    concreteTypeChecks()
    checkOpenHierarchy(Base())
    checkRuntimeConversion()
}
