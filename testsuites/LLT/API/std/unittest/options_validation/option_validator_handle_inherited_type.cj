/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC-PIPE-1: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan Option 'opt' is invalid. 'Derived' is invalid value for option.

// NOTE: This test check that custom validator lambda was called for Derived type.
// NOTE: Checks happens at runtime.

open class Base {
    public open func str() {
        "Base"
    }
}

class Derived <: Base {
    public func str() {
        "Derived"
    }
}

@UnittestOption[Base](opt, { x: Base =>
    match (x.str()) {
        case "Base" => None<String>
        case s => "'${s}' is invalid value for option."
    }
})

@Test
@Configure[opt: Derived()]
func foo() {}
