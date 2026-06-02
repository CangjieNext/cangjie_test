/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt | compare %f
// ASSERT: scan Supposed to fail
// ASSERT: scan-not 21234 reduction steps

import std.collection.*

interface UninterestingTestData {
    // skip the data that stops shrinking immediately
    func isNotInteresting(): Bool
}

extend Int8 <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0 || this == 1
    }
}

extend Int16 <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0 || this == 1
    }
}

extend Int32 <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0 || this == 1
    }
}

extend Int64 <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0 || this == 1
    }
}

extend IntNative <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0 || this == 1
    }
}

extend UInt8 <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0 || this == 1
    }
}

extend UInt16 <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0 || this == 1
    }
}

extend UInt32 <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0 || this == 1
    }
}

extend UInt64 <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0 || this == 1
    }
}

extend UIntNative <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0 || this == 1
    }
}

extend Float16 <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0.0 || this == 1.0 || this.isNaN() || this.isInf()
    }
}

extend Float32 <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0.0 || this == 1.0 || this.isNaN() || this.isInf()
    }
}

extend Float64 <: UninterestingTestData {
    public func isNotInteresting() {
        this == 0.0 || this == 1.0 || this.isNaN() || this.isInf()
    }
}

extend<T> Array<T> <: UninterestingTestData {
    public func isNotInteresting() {
        this.size < 2
    }
}

extend<T> ArrayList<T> <: UninterestingTestData {
    public func isNotInteresting() {
        this.size < 2
    }
}

extend<T> HashSet<T> <: UninterestingTestData {
    public func isNotInteresting() {
        this.size < 2
    }
}

extend<K, V> HashMap<K, V> <: UninterestingTestData {
    public func isNotInteresting() {
        this.size < 2
    }
}

// the goal of this test is to check that we do not loop infinitely in shrink loop
// so we set reductionSteps to a high unlikely number and check that it _doesn't_ take
// so many steps to shrink
@Configure[reductionSteps: 21234, generationSteps: 2000, randomSeed: 11]
@Test[x in random()]
@Types[T in<
 Int8, Int16, Int32, Int64, IntNative, 
 UInt8, UInt16, UInt32, UInt64, UIntNative, 
 Float16, Float32, Float64, 
 Array<Int64>, ArrayList<Int64>, HashSet<Int64>, HashMap<Int64, Int64> 
> 
]
func testPrimitives<T>(x: T) where T <: UninterestingTestData {
    // skip the data that converges immediately
    if (!x.isNotInteresting()) {
        @Fail("Supposed to fail")
    }
}
