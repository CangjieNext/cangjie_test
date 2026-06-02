/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC-1: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color
// ASSERT: scan PASSED: 0
// ASSERT: scan FAILED: 4

/*
 * Test reproduce possible scenario of detecting user bug:
 * - `removeEvenKeys` is the function with bug
 * - The bug should be detected in `test_should_detect_bug_in_removeEvenKeys`
 */

import std.collection.*
import std.random.*
import std.unittest.prop_test.*

interface Evenable {
    func isEven(): Bool
}

extend Int64 <: Evenable {
    public func isEven() {
        this % 2 == 0
    }
}

extend UInt32 <: Evenable {
    public func isEven() {
        this % 2 == 0
    }
}

@Test
@Types[K in<Int64, UInt32>, V in<Int64, Bool>] // NOTE: adding more types for V can cause OOM
@Configure[randomSeed: 42]
class ArbitraryHashMap<K, V> where K <: Hashable & Equatable<K> & Evenable & Arbitrary<K>, V <: Arbitrary<V> {

    // The function under test
    func removeEvenKeys(data: HashMap<K, V>) {
        let array = data.toArray()
        for (i in 0..array.size) {
            let (k, _) = array[i]
            // it removes not by even keys, but by even index
            // correct version should be `k.isEven()`
            if (i.isEven()) {
                data.remove(k)
            }
        }

        return data
    }

    @TestCase[data in random<HashMap<K, V>>()]
    func test_should_detect_bug_in_removeEvenKeys(data: HashMap<K, V>) {
        for ((k, v) in removeEvenKeys(data)) {
            @Assert(k.isEven()) // Unfiltered element detect
        }
    }
}
