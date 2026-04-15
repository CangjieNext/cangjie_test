/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.collection.*

@Test
class HashSetDeletedEntryTest {
    @TestCase
    func testMapAfterRemove(): Unit {
        var set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        @Expect(set.size, 3)
        
        set.remove(2)
        @Expect(set.size, 2)
        
        var mapped = set.map({x => x * 2})
        @Expect(mapped.size, 2)
        @Expect(mapped.contains(2))
        @Expect(mapped.contains(6))
        @Expect(!mapped.contains(4))
    }

    @TestCase
    func testFilterAfterRemove(): Unit {
        var set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        set.add(4)
        
        set.remove(2)
        @Expect(set.size, 3)
        
        var filtered = set.filter({x => x > 1})
        @Expect(filtered.size, 2)
        @Expect(filtered.contains(3))
        @Expect(filtered.contains(4))
        @Expect(!filtered.contains(1))
    }

    @TestCase
    func testAllAfterRemove(): Unit {
        var set = HashSet<Int64>()
        set.add(2)
        set.add(4)
        set.add(6)
        
        set.remove(4)
        
        @Expect(set.all({x => x % 2 == 0}))
    }

    @TestCase
    func testAnyAfterRemove(): Unit {
        var set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        
        set.remove(2)
        
        @Expect(set.any({x => x > 2}))
        @Expect(!set.any({x => x == 2}))
    }

    @TestCase
    func testNoneAfterRemove(): Unit {
        var set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        
        set.remove(2)
        
        @Expect(set.none({x => x > 10}))
        @Expect(!set.none({x => x == 1}))
    }

    @TestCase
    func testFoldAfterRemove(): Unit {
        var set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        
        set.remove(2)
        
        var sum = set.fold(0, {acc, x => acc + x})
        @Expect(sum, 4)
    }

    @TestCase
    func testReduceAfterRemove(): Unit {
        var set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        
        set.remove(2)
        
        var result = set.reduce({a, b => a + b})
        match (result) {
            case Some(v) => @Expect(v, 4)
            case None => @Expect(false, true)
        }
    }

    @TestCase
    func testFilterMapAfterRemove(): Unit {
        var set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        
        set.remove(2)
        
        var mapped = set.filterMap({x => 
            if (x > 1) {
                Some(x * 10)
            } else {
                None<Int64>
            }
        })
        @Expect(mapped.size, 1)
        @Expect(mapped.contains(30))
    }

    @TestCase
    func testMultipleRemoves(): Unit {
        var set = HashSet<Int64>()
        for (i in 0..10) {
            set.add(i)
        }
        @Expect(set.size, 10)
        
        for (i in 0..5) {
            set.remove(i)
        }
        @Expect(set.size, 5)
        
        var mapped = set.map({x => x * 2})
        @Expect(mapped.size, 5)
        
        var sum = set.fold(0, {acc, x => acc + x})
        @Expect(sum, 35)
    }
}
