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
class HashSetTest {
    @TestCase
    func initWithoutParameter(): Unit {
        var set1: HashSet<String> = HashSet<String>()
        @Expect(set1.size, 0)
        @Expect(set1.capacity, 16)

        var set2: HashSet<Int64> = HashSet<Int64>()
        @Expect(set2.size, 0)
        @Expect(set2.capacity, 16)
    }

    @TestCase
    func initByCollection(): Unit {
        var col: Collection<Int64> = [1, 2, 3]
        var set: HashSet<Int64> = HashSet<Int64>(col)
        var res: HashSet<Int64> = HashSet<Int64>([1, 2, 3])
        @Expect(set.size, 3)
        @Expect(set.capacity, 3)
        @Expect(set, res)
    }

    @TestCase
    func initByArray(): Unit {
        var arr: Array<Int64> = [3, 2, 1]
        var set: HashSet<Int64> = HashSet<Int64>(arr)
        var res: HashSet<Int64> = HashSet<Int64>([1, 2, 3])
        @Expect(set.size, 3)
        @Expect(set.capacity, 3)
        @Expect(set, res)
    }

    @TestCase
    func initByCapacity(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>(0)
        @Expect(set1.size, 0)
        @Expect(set1.capacity, 0)

        var set2: HashSet<Int64> = HashSet<Int64>(10)
        @Expect(set2.size, 0)
        @Expect(set2.capacity, 10)
    }

    @TestCase
    func initByFunction(): Unit {
        var set: HashSet<Int64> = HashSet<Int64>(10, {x: Int64 => (x * x)})
        var res: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        @Expect(set.size, 10)
        @Expect(set.capacity, 10)
        @Expect(set, res)
    }

    @TestCase
    func operatorOfEqual(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>([0, 1, 4])
        var res1: HashSet<Int64> = HashSet<Int64>([0, 1, 4])
        @Expect(set1 == res1)

        var set2: HashSet<Int64> = HashSet<Int64>()
        var res2: HashSet<Int64> = HashSet<Int64>()
        @Expect(set2 == res2)
    }

    @TestCase
    func operatorOfUnequal(): Unit {
        var set: HashSet<Int64> = HashSet<Int64>([0, 1, 4])
        var res1: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 5])
        var res2: HashSet<Int64> = HashSet<Int64>([0, 1, 3])
        var res3: HashSet<Int64> = HashSet<Int64>()
        @Expect(set != res1)
        @Expect(set != res2)
        @Expect(set != res3)
    }

    @TestCase
    func isEmpty(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>()
        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4])
        @Expect(set1.isEmpty())
        @Expect(!set2.isEmpty())
    }

    @TestCase
    func size(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>(10)
        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        @Expect(set1.size, 0)
        @Expect(set2.size, 10)
    }

    @TestCase
    func capacity(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>(10)
        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        @Expect(set1.capacity, 10)
        @Expect(set2.capacity, 10)
    }

    @TestCase
    func iterator(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>(10)
        var iter1 = set1.iterator()
        @Expect(iter1.next(), None)

        var arr: Array<Int64> = [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        var iterArr = arr.iterator()
        var iter2 = set2.iterator()
        while (true) {
            var value = iter2.next()
            match (value) {
                case Some(value) => @Expect(value, iterArr.next())
                case None => break
            }
        }
    }

    @TestCase
    func toString(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>()
        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4])
        @Expect(set1.toString(), "[]")
        @Expect(set2.toString(), "[0, 1, 4]")
    }

    @TestCase
    func contains(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>()
        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4])
        @Expect(!set1.contains(1))
        @Expect(set2.contains(0))
        @Expect(set2.contains(1))
        @Expect(set2.contains(4))
        @Expect(!set2.contains(5))
    }

    @TestCase
    func containsAll(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>()
        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        var set3: HashSet<Int64> = HashSet<Int64>([1, 4])
        var set4: HashSet<Int64> = HashSet<Int64>([0, 4, 81])
        var set5: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        var set6: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 82])
        @Expect(set1.contains(all: set1))
        @Expect(!set1.contains(all: set3))
        @Expect(set2.contains(all: set1))
        @Expect(set2.contains(all: set2))
        @Expect(set2.contains(all: set3))
        @Expect(set2.contains(all: set4))
        @Expect(set2.contains(all: set5))
        @Expect(!set2.contains(all: set6))
    }

    @TestCase
    func subsetOf(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>()
        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        var set3: HashSet<Int64> = HashSet<Int64>([1, 4])
        var set4: HashSet<Int64> = HashSet<Int64>([0, 4, 81])
        var set5: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        var set6: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 82])
        @Expect(set1.subsetOf(set1))
        @Expect(!set3.subsetOf(set1))
        @Expect(set1.subsetOf(set2))
        @Expect(set2.subsetOf(set2))
        @Expect(set3.subsetOf(set2))
        @Expect(set4.subsetOf(set2))
        @Expect(set5.subsetOf(set2))
        @Expect(!set6.subsetOf(set2))
    }

    @TestCase
    func put(): Unit {
        var set: HashSet<Int64> = HashSet<Int64>()
        set.add(0)
        @Expect(set, HashSet<Int64>([0]))
        set.add(4)
        @Expect(set, HashSet<Int64>([0, 4]))
        set.add(1)
        set.add(1)
        set.add(1)
        @Expect(set, HashSet<Int64>([0, 1, 4]))
    }

    @TestCase
    func putAll(): Unit {
        var set: HashSet<Int64> = HashSet<Int64>()
        set.add(all: [1, 4])
        @Expect(set, HashSet<Int64>([1, 4]))
        set.add(all: [0, 1, 9, 9, 9, 81])
        set.add(all: [0, 1, 9, 9, 9, 81])
        set.add(all: [0, 1, 9, 9, 9, 81])
        @Expect(set, HashSet<Int64>([0, 1, 4, 9, 81]))
        set.add(all: [64, 49, 36, 36, 16, 25])
        @Expect(set, HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81]))
    }

    @TestCase
    func clone(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>()
        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        @Expect(set1, set1.clone())
        @Expect(set2, set2.clone())
    }

    @TestCase
    func reserve(): Unit {
        var set: HashSet<Int64> = HashSet<Int64>(8)
        @Expect(set.capacity, 8)
        set.reserve(-1)
        @Expect(set.capacity, 8)
        set.reserve(0)
        @Expect(set.capacity, 8)
        set.add(all: [0, 1, 2, 3, 4, 5, 6, 7])
        @Expect(set.capacity, 8)
        set.reserve(6)
        @Expect(set.capacity, 14)
        set.reserve(6)
        @Expect(set.capacity, 14)
        set.reserve(16)
        @Expect(set.capacity, 24)
    }

    @TestCase
    func remove(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>()
        try {
            set1.remove(1)
        } catch (_) {
            @Expect("Should not throw exception", "")
        }

        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        try {
            set2.remove(-1)
        } catch (_) {
            @Expect("Should not throw exception", "")
        }
        set2.remove(0)
        set2.remove(9)
        set2.remove(9)
        set2.remove(81)
        @Expect(set2, HashSet<Int64>([1, 4, 16, 25, 36, 49, 64]))
    }

    @TestCase
    func removeAll(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>()
        try {
            set1.remove(all: [1, 2])
        } catch (_) {
            @Expect("Should not throw exception", "")
        }

        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        try {
            set2.remove(all: [-1, 2])
        } catch (_) {
            @Expect("Should not throw exception", "")
        }
        set2.remove(all: [0, 2])
        set2.remove(all: [9, 36])
        set2.remove(all: [9, 36])
        set2.remove(all: [81, 4, 0])
        @Expect(set2, HashSet<Int64>([1, 16, 25, 49, 64]))
    }

    @TestCase
    func removeIf(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>()
        try {
            set1.removeIf({_ => true})
            set1.removeIf({_ => false})
        } catch (_) {
            @Expect("Should not throw exception", "")
        }

        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        try {
            set2.removeIf({_ => true})
            set2.removeIf({_ => false})
        } catch (_) {
            @Expect("Should not throw exception", "")
        }

        var set3: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        set3.removeIf({x => (x < 16)})
        @Expect(set3, HashSet<Int64>([16, 25, 36, 49, 64, 81]))
        set3.removeIf({x => (x == 81)})
        @Expect(set3, HashSet<Int64>([16, 25, 36, 49, 64]))

        let set4: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        try {
            set4.removeIf(
                {
                    x =>
                    set4.remove(x)
                    return true
                }
            )
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }

        try {
            set4.removeIf(
                {
                    x =>
                    set4.remove(x)
                    return false
                }
            )
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }
    }

    @TestCase
    func clear(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>()
        try {
            set1.clear()
            @Expect(set1.isEmpty())
        } catch (_) {
            @Expect("Should not throw exception", "")
        }

        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        set2.clear()
        @Expect(set2.isEmpty())
    }

    @TestCase
    func retainAll(): Unit {
        var set1: HashSet<Int64> = HashSet<Int64>()
        try {
            set1.retain(all: HashSet<Int64>([1, 2]))
            @Expect(set1.isEmpty())
        } catch (_) {
            @Expect("Should not throw exception", "")
        }

        var set2: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        try {
            set2.retain(all: HashSet<Int64>([-1, 2]))
            @Expect(set2.isEmpty())
        } catch (_) {
            @Expect("Should not throw exception", "")
        }

        var set3: HashSet<Int64> = HashSet<Int64>([0, 1, 4, 9, 16, 25, 36, 49, 64, 81])
        set3.retain(all: HashSet<Int64>([0, 2, 1, 4, 36]))
        @Expect(set3, HashSet<Int64>([0, 1, 4, 36]))
        set3.retain(all: HashSet<Int64>([0, 1, 4, 36]))
        @Expect(set3, HashSet<Int64>([0, 1, 4, 36]))
        set3.retain(all: HashSet<Int64>([9, 16]))
        @Expect(set3.isEmpty())
    }

    @TestCase
    func intersect() {
        let set1: HashSet<Int64> = HashSet<Int64>([1, 2, 3, 4, 5])
        let set2: HashSet<Int64> = HashSet<Int64>([3, 4, 5, 6, 7])
        var result = set1 & set2
        @Expect(result, HashSet<Int64>([3, 4, 5]))
        @Expect(set1, HashSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, HashSet<Int64>([3, 4, 5, 6, 7]))

        let set3: HashSet<Int64> = HashSet<Int64>([8, 9])
        result = set1 & set3
        @Expect(result, HashSet<Int64>([]))
        @Expect(set1, HashSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, HashSet<Int64>([3, 4, 5, 6, 7]))
    }

    @TestCase
    func union() {
        let set1: HashSet<Int64> = HashSet<Int64>([1, 2, 3, 4, 5])
        let set2: HashSet<Int64> = HashSet<Int64>([3, 4, 5, 6, 7])
        var result = set1 | set2
        @Expect(result, HashSet<Int64>([1, 2, 3, 4, 5, 6, 7]))
        @Expect(set1, HashSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, HashSet<Int64>([3, 4, 5, 6, 7]))

        let set3: HashSet<Int64> = HashSet<Int64>([8, 9])
        result = set1 | set3
        @Expect(result, HashSet<Int64>([1, 2, 3, 4, 5, 8, 9]))
        @Expect(set1, HashSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, HashSet<Int64>([3, 4, 5, 6, 7]))
    }

    @TestCase
    func different() {
        let set1: HashSet<Int64> = HashSet<Int64>([1, 2, 3, 4, 5])
        let set2: HashSet<Int64> = HashSet<Int64>([3, 4, 5, 6, 7])
        var result = set1 - set2
        @Expect(result, HashSet<Int64>([1, 2]))
        @Expect(set1, HashSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, HashSet<Int64>([3, 4, 5, 6, 7]))

        let set3: HashSet<Int64> = HashSet<Int64>([8, 9])
        result = set1 - set3
        @Expect(result, HashSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set1, HashSet<Int64>([1, 2, 3, 4, 5]))
        @Expect(set2, HashSet<Int64>([3, 4, 5, 6, 7]))
    }
}
