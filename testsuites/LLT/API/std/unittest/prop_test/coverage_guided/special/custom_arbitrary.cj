/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt --sanitizer-coverage-trace-pc-guard --sanitizer-coverage-trace-compares 
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color --coverage-guided | compare %f
// ASSERT: scan-2 Expect Failed

import std.random.*
import std.unittest.prop_test.*

class SimpleClass <: Equatable<SimpleClass> {
    SimpleClass(let x: Int64, let y: Int64) {}

    public operator func ==(that: SimpleClass): Bool {
        this.x == that.x && this.y == that.y
    }
    public operator func !=(that: SimpleClass): Bool {
        this.x != that.x || this.y != that.y
    }
}

extend SimpleClass <: Arbitrary<SimpleClass> {
    public static func arbitrary(random: RandomSource): Generator<SimpleClass> {
        let gen1 = Int64.arbitrary(random)
        let gen2 = Int64.arbitrary(random)
        return Generators.generate {
            SimpleClass(gen1.next(), gen2.next())
        }
    }
}

@Test[x in random() 
]
@Configure[randomSeed: 100]
@OverflowWrapping
func triggerGCov(x: SimpleClass) {
    @Expect(x.y != 12345678)
}

@Test[x in random() 
]
@Configure[randomSeed: 100]
@OverflowWrapping
func triggerGCov2(x: SimpleClass) {
    @Expect(x.y != x.x + 150000)
}
