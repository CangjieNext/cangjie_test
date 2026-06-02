/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-1: %run %run_opt %output %run_utest_opt

import std.unittest.prop_test.*

class SimpleClass <: ToString {
    SimpleClass(let name: String, let number: Int64) {}

    public func toString(): String {
        "SimpleClass(${name}, ${number})"
    }
}

extend SimpleClass <: Arbitrary<SimpleClass> {
    public static func arbitrary(random: RandomSource): Generator<SimpleClass> {
        let stringGenerator = String.arbitrary(random)
        let numberGenerator = Int64.arbitrary(random)
        return Generators.generate {
            SimpleClass(stringGenerator.next(), numberGenerator.next())
        }
    }
}

@Test[x in random()]
@Configure[randomSeed: 0, generationSteps: 300]
func foo(x: SimpleClass): Unit {
    // we can now write tests for SimpleClass
    @Expect(x.name.size != x.number)
}
// case from unittest_lib.md, if it's updated, pls update unittest_lib.md as well.
