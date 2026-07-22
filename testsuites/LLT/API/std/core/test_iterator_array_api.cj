/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

@Test
class IteratorMapFilterTest {
    @TestCase
    func testMap(): Unit {
        var sum = 0
        for (v in [1, 2, 3].iterator().map({ x: Int64 => x * 2 })) {
            sum += v
        }
        @Expect(sum, 12)
    }

    @TestCase
    func testFilter(): Unit {
        var sum = 0
        for (v in [1, 2, 3, 4, 5, 6].iterator().filter({ x: Int64 => x % 2 == 0 })) {
            sum += v
        }
        @Expect(sum, 12)
    }

    @TestCase
    func testFilterNoMatch(): Unit {
        var count = 0
        for (_ in [1, 3, 5].iterator().filter({ x: Int64 => x % 2 == 0 })) {
            count++
        }
        @Expect(count, 0)
    }

    @TestCase
    func testMapEmpty(): Unit {
        var count = 0
        for (_ in Array<Int64>(0, repeat: 0).iterator().map({ x: Int64 => x + 1 })) {
            count++
        }
        @Expect(count, 0)
    }
}

@Test
class IteratorZipEnumerateTest {
    @TestCase
    func testZip(): Unit {
        var sum = 0
        for ((a, b) in [1, 2, 3].iterator().zip([10, 20, 30].iterator())) {
            sum += a + b
        }
        @Expect(sum, 66)
    }

    @TestCase
    func testZipUnequal(): Unit {
        var count = 0
        for ((_, _) in [1, 2, 3, 4, 5].iterator().zip([10, 20].iterator())) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func testZipEmpty(): Unit {
        var count = 0
        for ((_, _) in Array<Int64>(0, repeat: 0).iterator().zip([1, 2, 3].iterator())) {
            count++
        }
        @Expect(count, 0)
    }

    @TestCase
    func testEnumerate(): Unit {
        var idx0: Int64 = -1
        var idx1: Int64 = -1
        var idx2: Int64 = -1
        for ((i, v) in [10, 20, 30].iterator().enumerate()) {
            if (i == 0) { idx0 = v }
            if (i == 1) { idx1 = v }
            if (i == 2) { idx2 = v }
        }
        @Expect(idx0, 10)
        @Expect(idx1, 20)
        @Expect(idx2, 30)
    }

    @TestCase
    func testEnumerateEmpty(): Unit {
        var count = 0
        for (_ in Array<Int64>(0, repeat: 0).iterator().enumerate()) {
            count++
        }
        @Expect(count, 0)
    }
}

@Test
class IteratorStepSkipTakeTest {
    @TestCase
    func testStep(): Unit {
        var sum = 0
        for (v in [1, 2, 3, 4, 5, 6, 7].iterator().step(2)) {
            sum += v
        }
        @Expect(sum, 12)
    }

    @TestCase
    func testStepOne(): Unit {
        var count = 0
        for (_ in [1, 2, 3].iterator().step(1)) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func testSkip(): Unit {
        var sum = 0
        for (v in [1, 2, 3, 4, 5].iterator().skip(2)) {
            sum += v
        }
        @Expect(sum, 12)
    }

    @TestCase
    func testSkipZero(): Unit {
        var count = 0
        for (_ in [1, 2, 3].iterator().skip(0)) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func testSkipAll(): Unit {
        var count = 0
        for (_ in [1, 2, 3].iterator().skip(5)) {
            count++
        }
        @Expect(count, 0)
    }

    @TestCase
    func testTake(): Unit {
        var sum = 0
        for (v in [1, 2, 3, 4, 5].iterator().take(3)) {
            sum += v
        }
        @Expect(sum, 6)
    }

    @TestCase
    func testTakeZero(): Unit {
        var count = 0
        for (_ in [1, 2, 3].iterator().take(0)) {
            count++
        }
        @Expect(count, 0)
    }

    @TestCase
    func testTakeMoreThanSize(): Unit {
        var count = 0
        for (_ in [1, 2, 3].iterator().take(10)) {
            count++
        }
        @Expect(count, 3)
    }
}

@Test
class IteratorConcatFlatMapTest {
    @TestCase
    func testConcat(): Unit {
        var sum = 0
        for (v in [1, 2, 3].iterator().concat([4, 5].iterator())) {
            sum += v
        }
        @Expect(sum, 15)
    }

    @TestCase
    func testConcatEmptyFirst(): Unit {
        var count = 0
        for (v in Array<Int64>(0, repeat: 0).iterator().concat([1, 2].iterator())) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func testConcatEmptySecond(): Unit {
        var count = 0
        for (v in [1, 2].iterator().concat(Array<Int64>(0, repeat: 0).iterator())) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func testFlatMap(): Unit {
        var sum = 0
        for (v in [1, 2, 3].iterator().flatMap({ x: Int64 => [x, x * 10].iterator() })) {
            sum += v
        }
        @Expect(sum, 66)
    }

    @TestCase
    func testFlatMapEmptySubiter(): Unit {
        var count = 0
        for (_ in [1, 2, 3].iterator().flatMap({ _: Int64 => Array<Int64>(0, repeat: 0).iterator() })) {
            count++
        }
        @Expect(count, 0)
    }
}

@Test
class IteratorInspectIntersperseTest {
    @TestCase
    func testInspect(): Unit {
        let acc = [0]
        for (_ in [1, 2, 3].iterator().inspect({ x: Int64 => acc[0] += x })) {
            ()
        }
        @Expect(acc[0], 6)
    }

    @TestCase
    func testInspectEmpty(): Unit {
        let acc = [0]
        for (_ in Array<Int64>(0, repeat: 0).iterator().inspect({ _: Int64 => acc[0]++ })) {
            ()
        }
        @Expect(acc[0], 0)
    }

    @TestCase
    func testIntersperse(): Unit {
        var sum = 0
        for (v in [1, 2, 3].iterator().intersperse(0)) {
            sum += v
        }
        @Expect(sum, 6)
    }

    @TestCase
    func testIntersperseSingle(): Unit {
        var count = 0
        for (_ in [42].iterator().intersperse(0)) {
            count++
        }
        @Expect(count, 1)
    }

    @TestCase
    func testIntersperseEmpty(): Unit {
        var count = 0
        for (_ in Array<Int64>(0, repeat: 0).iterator().intersperse(0)) {
            count++
        }
        @Expect(count, 0)
    }
}

@Test
class IteratorAllAnyNoneTest {
    @TestCase
    func testAllTrue(): Unit {
        @Expect([2, 4, 6].iterator().all({ x: Int64 => x % 2 == 0 }), true)
    }

    @TestCase
    func testAllFalse(): Unit {
        @Expect([2, 3, 4].iterator().all({ x: Int64 => x % 2 == 0 }), false)
    }

    @TestCase
    func testAllEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).iterator().all({ _: Int64 => false }), true)
    }

    @TestCase
    func testAnyTrue(): Unit {
        @Expect([1, 3, 5, 6].iterator().any({ x: Int64 => x % 2 == 0 }), true)
    }

    @TestCase
    func testAnyFalse(): Unit {
        @Expect([1, 3, 5].iterator().any({ x: Int64 => x % 2 == 0 }), false)
    }

    @TestCase
    func testAnyEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).iterator().any({ _: Int64 => true }), false)
    }

    @TestCase
    func testNoneTrue(): Unit {
        @Expect([1, 3, 5].iterator().none({ x: Int64 => x % 2 == 0 }), true)
    }

    @TestCase
    func testNoneFalse(): Unit {
        @Expect([1, 3, 6].iterator().none({ x: Int64 => x % 2 == 0 }), false)
    }

    @TestCase
    func testNoneEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).iterator().none({ _: Int64 => true }), true)
    }
}

@Test
class IteratorCountForEachTest {
    @TestCase
    func testCount(): Unit {
        @Expect([1, 2, 3, 4, 5].iterator().count(), 5)
    }

    @TestCase
    func testCountEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).iterator().count(), 0)
    }

    @TestCase
    func testForEach(): Unit {
        var sum = 0
        for (x in [1, 2, 3, 4]) { sum += x }
        @Expect(sum, 10)
    }

    @TestCase
    func testForEachEmpty(): Unit {
        var sum = 0
        for (x in Array<Int64>(0, repeat: 0)) { sum += x }
        @Expect(sum, 0)
    }
}

@Test
class IteratorFirstLastAtTest {
    @TestCase
    func testFirst(): Unit {
        match ([1, 2, 3].iterator().first()) {
            case Some(v) => @Expect(v, 1)
            case Option<Int64>.None => @Assert(false)
        }
    }

    @TestCase
    func testFirstEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).iterator().first().isNone(), true)
    }

    @TestCase
    func testLast(): Unit {
        match ([1, 2, 3].iterator().last()) {
            case Some(v) => @Expect(v, 3)
            case Option<Int64>.None => @Assert(false)
        }
    }

    @TestCase
    func testLastEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).iterator().last().isNone(), true)
    }

    @TestCase
    func testAtValid(): Unit {
        match ([10, 20, 30].iterator().at(1)) {
            case Some(v) => @Expect(v, 20)
            case Option<Int64>.None => @Assert(false)
        }
    }

    @TestCase
    func testAtOutOfRange(): Unit {
        @Expect([10, 20, 30].iterator().at(5).isNone(), true)
    }

    @TestCase
    func testAtNegative(): Unit {
        @Expect([10, 20, 30].iterator().at(-1).isNone(), true)
    }

    @TestCase
    func testAtZero(): Unit {
        match ([10, 20, 30].iterator().at(0)) {
            case Some(v) => @Expect(v, 10)
            case Option<Int64>.None => @Assert(false)
        }
    }
}

@Test
class IteratorContainsTest {
    @TestCase
    func testContainsFound(): Unit {
        @Expect([1, 2, 3].iterator().contains(2), true)
    }

    @TestCase
    func testContainsNotFound(): Unit {
        @Expect([1, 2, 3].iterator().contains(5), false)
    }

    @TestCase
    func testContainsEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).iterator().contains(1), false)
    }
}

@Test
class IteratorMaxMinTest {
    @TestCase
    func testMax(): Unit {
        match ([3, 1, 4, 1, 5].iterator().max()) {
            case Some(v) => @Expect(v, 5)
            case Option<Int64>.None => @Assert(false)
        }
    }

    @TestCase
    func testMaxEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).iterator().max().isNone(), true)
    }

    @TestCase
    func testMin(): Unit {
        match ([3, 1, 4, 1, 5].iterator().min()) {
            case Some(v) => @Expect(v, 1)
            case Option<Int64>.None => @Assert(false)
        }
    }

    @TestCase
    func testMinEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).iterator().min().isNone(), true)
    }

    @TestCase
    func testMaxSingle(): Unit {
        match ([42].iterator().max()) {
            case Some(v) => @Expect(v, 42)
            case Option<Int64>.None => @Assert(false)
        }
    }
}

@Test
class IteratorReduceFoldTest {
    @TestCase
    func testReduce(): Unit {
        match ([1, 2, 3, 4].iterator().reduce({ a: Int64, b: Int64 => a + b })) {
            case Some(v) => @Expect(v, 10)
            case Option<Int64>.None => @Assert(false)
        }
    }

    @TestCase
    func testReduceEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).iterator().reduce({ a: Int64, b: Int64 => a + b }).isNone(), true)
    }

    @TestCase
    func testReduceSingle(): Unit {
        match ([42].iterator().reduce({ a: Int64, b: Int64 => a + b })) {
            case Some(v) => @Expect(v, 42)
            case Option<Int64>.None => @Assert(false)
        }
    }

    @TestCase
    func testFold(): Unit {
        let result = [1, 2, 3, 4].iterator().fold(10, { a: Int64, b: Int64 => a + b })
        @Expect(result, 20)
    }

    @TestCase
    func testFoldEmpty(): Unit {
        let result = Array<Int64>(0, repeat: 0).iterator().fold(42, { a: Int64, _: Int64 => a })
        @Expect(result, 42)
    }

    @TestCase
    func testFoldMultiplication(): Unit {
        let result = [1, 2, 3, 4].iterator().fold(1, { a: Int64, b: Int64 => a * b })
        @Expect(result, 24)
    }
}

@Test
class IteratorFilterMapTest {
    @TestCase
    func testFilterMap(): Unit {
        var sum = 0
        for (v in [1, 2, 3, 4, 5].iterator().filterMap({ x: Int64 =>
            if (x % 2 == 0) { Some(x * 10) } else { Option<Int64>.None }
        })) {
            sum += v
        }
        @Expect(sum, 60)
    }

    @TestCase
    func testFilterMapAllNone(): Unit {
        var count = 0
        for (_ in [1, 3, 5].iterator().filterMap({ _: Int64 => Option<Int64>.None })) {
            count++
        }
        @Expect(count, 0)
    }

    @TestCase
    func testFilterMapAllSome(): Unit {
        var count = 0
        for (_ in [1, 2, 3].iterator().filterMap({ x: Int64 => Some(x) })) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func testFilterMapEmpty(): Unit {
        var count = 0
        for (_ in Array<Int64>(0, repeat: 0).iterator().filterMap({ x: Int64 => Some(x) })) {
            count++
        }
        @Expect(count, 0)
    }
}

@Test
class IteratorIsEmptyTest {
    @TestCase
    func testIsEmptyFalse(): Unit {
        @Expect([1, 2, 3].iterator().isEmpty(), false)
    }

    @TestCase
    func testIsEmptyTrue(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).iterator().isEmpty(), true)
    }
}

@Test
class IteratorExceptionTest {
    @TestCase
    func testStepCountZero(): Unit {
        try {
            let _ = [1, 2, 3].iterator().step(0)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testStepCountNegative(): Unit {
        try {
            let _ = [1, 2, 3].iterator().step(-1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testSkipCountNegative(): Unit {
        try {
            let _ = [1, 2, 3].iterator().skip(-1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testTakeCountNegative(): Unit {
        try {
            let _ = [1, 2, 3].iterator().take(-1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }
}

@Test
class ArrayReverseFillSwapTest {
    @TestCase
    func testReverse(): Unit {
        let arr = [1, 2, 3, 4, 5]
        arr.reverse()
        @Expect(arr[0], 5)
        @Expect(arr[1], 4)
        @Expect(arr[2], 3)
        @Expect(arr[3], 2)
        @Expect(arr[4], 1)
    }

    @TestCase
    func testReverseSingle(): Unit {
        let arr = [42]
        arr.reverse()
        @Expect(arr[0], 42)
    }

    @TestCase
    func testReverseEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        arr.reverse()
        @Expect(arr.size, 0)
    }

    @TestCase
    func testReverseTwo(): Unit {
        let arr = [1, 2]
        arr.reverse()
        @Expect(arr[0], 2)
        @Expect(arr[1], 1)
    }

    @TestCase
    func testFill(): Unit {
        let arr = Array<Int64>(5, repeat: 0)
        arr.fill(7)
        @Expect(arr[0], 7)
        @Expect(arr[4], 7)
    }

    @TestCase
    func testFillEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        arr.fill(7)
        @Expect(arr.size, 0)
    }

    @TestCase
    func testSwap(): Unit {
        let arr = [1, 2, 3, 4, 5]
        arr.swap(0, 4)
        @Expect(arr[0], 5)
        @Expect(arr[4], 1)
    }

    @TestCase
    func testSwapSame(): Unit {
        let arr = [1, 2, 3]
        arr.swap(1, 1)
        @Expect(arr[1], 2)
    }

    @TestCase
    func testSwapOutOfRange(): Unit {
        let arr = [1, 2, 3]
        try {
            arr.swap(0, 5)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testSwapNegativeIndex(): Unit {
        let arr = [1, 2, 3]
        try {
            arr.swap(-1, 0)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }
}

@Test
class ArrayConcatRepeatTest {
    @TestCase
    func testConcat(): Unit {
        let a = [1, 2, 3]
        let b = [4, 5]
        let c = a.concat(b)
        @Expect(c.size, 5)
        @Expect(c[0], 1)
        @Expect(c[3], 4)
        @Expect(c[4], 5)
    }

    @TestCase
    func testConcatEmptyFirst(): Unit {
        let a = Array<Int64>(0, repeat: 0)
        let b = [1, 2]
        let c = a.concat(b)
        @Expect(c.size, 2)
        @Expect(c[0], 1)
    }

    @TestCase
    func testConcatEmptySecond(): Unit {
        let a = [1, 2]
        let b = Array<Int64>(0, repeat: 0)
        let c = a.concat(b)
        @Expect(c.size, 2)
        @Expect(c[0], 1)
    }

    @TestCase
    func testConcatBothEmpty(): Unit {
        let a = Array<Int64>(0, repeat: 0)
        let b = Array<Int64>(0, repeat: 0)
        let c = a.concat(b)
        @Expect(c.size, 0)
    }

    @TestCase
    func testRepeat(): Unit {
        let arr = [1, 2]
        let r = arr.repeat(3)
        @Expect(r.size, 6)
        @Expect(r[0], 1)
        @Expect(r[1], 2)
        @Expect(r[2], 1)
        @Expect(r[3], 2)
        @Expect(r[4], 1)
        @Expect(r[5], 2)
    }

    @TestCase
    func testRepeatOnce(): Unit {
        let arr = [1, 2, 3]
        let r = arr.repeat(1)
        @Expect(r.size, 3)
        @Expect(r[0], 1)
    }

    @TestCase
    func testRepeatEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        let r = arr.repeat(3)
        @Expect(r.size, 0)
    }

    @TestCase
    func testRepeatZero(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.repeat(0)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testRepeatNegative(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.repeat(-1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }
}

@Test
class ArrayMapStepTakeSkipTest {
    @TestCase
    func testMap(): Unit {
        let arr = [1, 2, 3]
        let m = arr.map({ x: Int64 => x * 10 })
        @Expect(m.size, 3)
        @Expect(m[0], 10)
        @Expect(m[1], 20)
        @Expect(m[2], 30)
    }

    @TestCase
    func testMapEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        let m = arr.map({ x: Int64 => x * 10 })
        @Expect(m.size, 0)
    }

    @TestCase
    func testStep(): Unit {
        let arr = [1, 2, 3, 4, 5, 6, 7]
        let s = arr.step(2)
        @Expect(s.size, 4)
        @Expect(s[0], 1)
        @Expect(s[1], 3)
        @Expect(s[2], 5)
        @Expect(s[3], 7)
    }

    @TestCase
    func testStepOne(): Unit {
        let arr = [1, 2, 3]
        let s = arr.step(1)
        @Expect(s.size, 3)
    }

    @TestCase
    func testStepEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        let s = arr.step(2)
        @Expect(s.size, 0)
    }

    @TestCase
    func testStepZero(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.step(0)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testStepNegative(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.step(-1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testTake(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let t = arr.take(3)
        @Expect(t.size, 3)
        @Expect(t[0], 1)
        @Expect(t[2], 3)
    }

    @TestCase
    func testTakeZero(): Unit {
        let arr = [1, 2, 3]
        let t = arr.take(0)
        @Expect(t.size, 0)
    }

    @TestCase
    func testTakeMoreThanSize(): Unit {
        let arr = [1, 2, 3]
        let t = arr.take(10)
        @Expect(t.size, 3)
    }

    @TestCase
    func testTakeNegative(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.take(-1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testSkip(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let s = arr.skip(2)
        @Expect(s.size, 3)
        @Expect(s[0], 3)
        @Expect(s[2], 5)
    }

    @TestCase
    func testSkipZero(): Unit {
        let arr = [1, 2, 3]
        let s = arr.skip(0)
        @Expect(s.size, 3)
        @Expect(s[0], 1)
    }

    @TestCase
    func testSkipAll(): Unit {
        let arr = [1, 2, 3]
        let s = arr.skip(5)
        @Expect(s.size, 0)
    }

    @TestCase
    func testSkipNegative(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.skip(-1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }
}

@Test
class ArrayFilterFlatMapTest {
    @TestCase
    func testFilter(): Unit {
        let arr = [1, 2, 3, 4, 5, 6]
        let f = arr.filter({ x: Int64 => x % 2 == 0 })
        @Expect(f.size, 3)
        @Expect(f[0], 2)
        @Expect(f[1], 4)
        @Expect(f[2], 6)
    }

    @TestCase
    func testFilterNoMatch(): Unit {
        let arr = [1, 3, 5]
        let f = arr.filter({ x: Int64 => x % 2 == 0 })
        @Expect(f.size, 0)
    }

    @TestCase
    func testFilterAllMatch(): Unit {
        let arr = [2, 4, 6]
        let f = arr.filter({ x: Int64 => x % 2 == 0 })
        @Expect(f.size, 3)
    }

    @TestCase
    func testFilterEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        let f = arr.filter({ x: Int64 => true })
        @Expect(f.size, 0)
    }

    @TestCase
    func testFlatMap(): Unit {
        let arr = [1, 2, 3]
        let f = arr.flatMap({ x: Int64 => [x, x * 10] })
        @Expect(f.size, 6)
        @Expect(f[0], 1)
        @Expect(f[1], 10)
        @Expect(f[2], 2)
        @Expect(f[3], 20)
        @Expect(f[4], 3)
        @Expect(f[5], 30)
    }

    @TestCase
    func testFlatMapEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        let f = arr.flatMap({ x: Int64 => [x] })
        @Expect(f.size, 0)
    }

    @TestCase
    func testFlatMapEmptySub(): Unit {
        let arr = [1, 2, 3]
        let f = arr.flatMap({ _: Int64 => Array<Int64>(0, repeat: 0) })
        @Expect(f.size, 0)
    }
}

@Test
class ArrayFilterMapIntersperseTest {
    @TestCase
    func testFilterMap(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let f = arr.filterMap({ x: Int64 =>
            if (x % 2 == 0) { Some(x * 10) } else { Option<Int64>.None }
        })
        @Expect(f.size, 2)
        @Expect(f[0], 20)
        @Expect(f[1], 40)
    }

    @TestCase
    func testFilterMapAllNone(): Unit {
        let arr = [1, 3, 5]
        let f = arr.filterMap({ _: Int64 => Option<Int64>.None })
        @Expect(f.size, 0)
    }

    @TestCase
    func testFilterMapAllSome(): Unit {
        let arr = [1, 2, 3]
        let f = arr.filterMap({ x: Int64 => Some(x) })
        @Expect(f.size, 3)
    }

    @TestCase
    func testFilterMapEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        let f = arr.filterMap({ x: Int64 => Some(x) })
        @Expect(f.size, 0)
    }

    @TestCase
    func testIntersperse(): Unit {
        let arr = [1, 2, 3]
        let i = arr.intersperse(0)
        @Expect(i.size, 5)
        @Expect(i[0], 1)
        @Expect(i[1], 0)
        @Expect(i[2], 2)
        @Expect(i[3], 0)
        @Expect(i[4], 3)
    }

    @TestCase
    func testIntersperseSingle(): Unit {
        let arr = [42]
        let i = arr.intersperse(0)
        @Expect(i.size, 1)
        @Expect(i[0], 42)
    }

    @TestCase
    func testIntersperseEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        let i = arr.intersperse(0)
        @Expect(i.size, 0)
    }

    @TestCase
    func testIntersperseTwo(): Unit {
        let arr = [1, 2]
        let i = arr.intersperse(0)
        @Expect(i.size, 3)
        @Expect(i[0], 1)
        @Expect(i[1], 0)
        @Expect(i[2], 2)
    }
}

@Test
class ArrayForEachAllAnyNoneTest {
    @TestCase
    func testForEach(): Unit {
        let arr = [1, 2, 3, 4]
        var sum = 0
        for (x in arr) { sum += x }
        @Expect(sum, 10)
    }

    @TestCase
    func testForEachEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        var sum = 0
        for (x in arr) { sum += x }
        @Expect(sum, 0)
    }

    @TestCase
    func testAllTrue(): Unit {
        @Expect([2, 4, 6].all({ x: Int64 => x % 2 == 0 }), true)
    }

    @TestCase
    func testAllFalse(): Unit {
        @Expect([2, 3, 4].all({ x: Int64 => x % 2 == 0 }), false)
    }

    @TestCase
    func testAllEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).all({ _: Int64 => false }), true)
    }

    @TestCase
    func testAnyTrue(): Unit {
        @Expect([1, 3, 6].any({ x: Int64 => x % 2 == 0 }), true)
    }

    @TestCase
    func testAnyFalse(): Unit {
        @Expect([1, 3, 5].any({ x: Int64 => x % 2 == 0 }), false)
    }

    @TestCase
    func testAnyEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).any({ _: Int64 => true }), false)
    }

    @TestCase
    func testNoneTrue(): Unit {
        @Expect([1, 3, 5].none({ x: Int64 => x % 2 == 0 }), true)
    }

    @TestCase
    func testNoneFalse(): Unit {
        @Expect([1, 3, 6].none({ x: Int64 => x % 2 == 0 }), false)
    }

    @TestCase
    func testNoneEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).none({ _: Int64 => true }), true)
    }
}

@Test
class ArrayFoldReduceTest {
    @TestCase
    func testFold(): Unit {
        let result = [1, 2, 3, 4].fold(10, { a: Int64, b: Int64 => a + b })
        @Expect(result, 20)
    }

    @TestCase
    func testFoldEmpty(): Unit {
        let result = Array<Int64>(0, repeat: 0).fold(42, { a: Int64, _: Int64 => a })
        @Expect(result, 42)
    }

    @TestCase
    func testFoldMultiplication(): Unit {
        let result = [1, 2, 3, 4].fold(1, { a: Int64, b: Int64 => a * b })
        @Expect(result, 24)
    }

    @TestCase
    func testReduce(): Unit {
        match ([1, 2, 3, 4].reduce({ a: Int64, b: Int64 => a + b })) {
            case Some(v) => @Expect(v, 10)
            case Option<Int64>.None => @Assert(false)
        }
    }

    @TestCase
    func testReduceEmpty(): Unit {
        @Expect(Array<Int64>(0, repeat: 0).reduce({ a: Int64, b: Int64 => a + b }).isNone(), true)
    }

    @TestCase
    func testReduceSingle(): Unit {
        match ([42].reduce({ a: Int64, b: Int64 => a + b })) {
            case Some(v) => @Expect(v, 42)
            case Option<Int64>.None => @Assert(false)
        }
    }
}

@Test
class ArrayZipEnumerateFlattenTest {
    @TestCase
    func testZip(): Unit {
        let a = [1, 2, 3]
        let b = [10, 20, 30]
        let z = a.zip(b)
        @Expect(z.size, 3)
        match (z[0]) {
            case (x, y) => @Expect(x, 1); @Expect(y, 10)
        }
        match (z[2]) {
            case (x, y) => @Expect(x, 3); @Expect(y, 30)
        }
    }

    @TestCase
    func testZipUnequal(): Unit {
        let a = [1, 2, 3, 4, 5]
        let b = [10, 20]
        let z = a.zip(b)
        @Expect(z.size, 2)
    }

    @TestCase
    func testZipEmptyFirst(): Unit {
        let a = Array<Int64>(0, repeat: 0)
        let b = [1, 2, 3]
        let z = a.zip(b)
        @Expect(z.size, 0)
    }

    @TestCase
    func testZipEmptySecond(): Unit {
        let a = [1, 2, 3]
        let b = Array<Int64>(0, repeat: 0)
        let z = a.zip(b)
        @Expect(z.size, 0)
    }

    @TestCase
    func testEnumerate(): Unit {
        let arr = [10, 20, 30]
        let e = arr.enumerate()
        @Expect(e.size, 3)
        match (e[0]) {
            case (i, v) => @Expect(i, 0); @Expect(v, 10)
        }
        match (e[2]) {
            case (i, v) => @Expect(i, 2); @Expect(v, 30)
        }
    }

    @TestCase
    func testEnumerateEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        let e = arr.enumerate()
        @Expect(e.size, 0)
    }

    @TestCase
    func testFlatten(): Unit {
        let nested = [[1, 2], [3, 4], [5, 6]]
        let flat = nested.flatten()
        @Expect(flat.size, 6)
        @Expect(flat[0], 1)
        @Expect(flat[5], 6)
    }

    @TestCase
    func testFlattenEmptySub(): Unit {
        let nested = [Array<Int64>(0, repeat: 0), [1, 2], Array<Int64>(0, repeat: 0)]
        let flat = nested.flatten()
        @Expect(flat.size, 2)
        @Expect(flat[0], 1)
        @Expect(flat[1], 2)
    }

    @TestCase
    func testFlattenAllEmpty(): Unit {
        let nested = [Array<Int64>(0, repeat: 0), Array<Int64>(0, repeat: 0)]
        let flat = nested.flatten()
        @Expect(flat.size, 0)
    }

    @TestCase
    func testFlattenEmpty(): Unit {
        let nested = Array<Array<Int64>>(0, repeat: Array<Int64>(0, repeat: 0))
        let flat = nested.flatten()
        @Expect(flat.size, 0)
    }
}

@Test
class ArrayCopyToTest {
    @TestCase
    func testCopyToBasic(): Unit {
        let src = [1, 2, 3, 4, 5]
        let dst = Array<Int64>(3, repeat: 0)
        src.copyTo(dst, 1, 0, 3)
        @Expect(dst[0], 2)
        @Expect(dst[1], 3)
        @Expect(dst[2], 4)
    }

    @TestCase
    func testCopyToFull(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        src.copyTo(dst)
        @Expect(dst[0], 1)
        @Expect(dst[1], 2)
        @Expect(dst[2], 3)
    }

    @TestCase
    func testCopyToZeroLen(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        src.copyTo(dst, 0, 0, 0)
        @Expect(dst[0], 0)
    }

    @TestCase
    func testCopyToNegativeLen(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        try {
            src.copyTo(dst, 0, 0, -1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testCopyToNegativeSrcStart(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        try {
            src.copyTo(dst, -1, 0, 1)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testCopyToNegativeDstStart(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        try {
            src.copyTo(dst, 0, -1, 1)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testCopyToSrcStartOutOfBounds(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        try {
            src.copyTo(dst, 5, 0, 1)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testCopyToDstStartOutOfBounds(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        try {
            src.copyTo(dst, 0, 5, 1)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testCopyToLenOutOfBounds(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        try {
            src.copyTo(dst, 0, 0, 5)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testCopyToDstTooSmall(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(2, repeat: 0)
        try {
            src.copyTo(dst)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testCopyToEmptySrc(): Unit {
        let src = Array<Int64>(0, repeat: 0)
        let dst = Array<Int64>(3, repeat: 0)
        src.copyTo(dst)
        @Expect(dst[0], 0)
    }
}

@Test
class ArrayCloneSliceTest {
    @TestCase
    func testCloneBasic(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let c = arr.clone()
        @Expect(c.size, 5)
        @Expect(c[0], 1)
        @Expect(c[4], 5)
    }

    @TestCase
    func testCloneEmpty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        let c = arr.clone()
        @Expect(c.size, 0)
    }

    @TestCase
    func testCloneRange(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let c = arr.clone(1..4)
        @Expect(c.size, 3)
        @Expect(c[0], 2)
        @Expect(c[1], 3)
        @Expect(c[2], 4)
    }

    @TestCase
    func testCloneRangeClosed(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let c = arr.clone(1..=3)
        @Expect(c.size, 3)
        @Expect(c[0], 2)
        @Expect(c[2], 4)
    }

    @TestCase
    func testCloneRangeFull(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let c = arr.clone(0..5)
        @Expect(c.size, 5)
    }

    @TestCase
    func testCloneRangeFromStart(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let c = arr.clone(0..3)
        @Expect(c.size, 3)
        @Expect(c[0], 1)
    }

    @TestCase
    func testCloneNegativeStep(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let c = arr.clone(4..=0: -1)
        @Expect(c.size, 5)
        @Expect(c[0], 5)
        @Expect(c[4], 1)
    }

    @TestCase
    func testCloneNegativeStepPartial(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let c = arr.clone(3..=1: -1)
        @Expect(c.size, 3)
        @Expect(c[0], 4)
        @Expect(c[1], 3)
        @Expect(c[2], 2)
    }

    @TestCase
    func testSliceBasic(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let s = arr.slice(1, 3)
        @Expect(s.size, 3)
        @Expect(s[0], 2)
        @Expect(s[1], 3)
        @Expect(s[2], 4)
    }

    @TestCase
    func testSliceZero(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let s = arr.slice(0, 5)
        @Expect(s.size, 5)
        @Expect(s[0], 1)
    }

    @TestCase
    func testSliceEmpty(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let s = arr.slice(2, 0)
        @Expect(s.size, 0)
    }

    @TestCase
    func testSliceNegativeStart(): Unit {
        let arr = [1, 2, 3, 4, 5]
        try {
            let _ = arr.slice(-1, 2)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testSliceNegativeLen(): Unit {
        let arr = [1, 2, 3, 4, 5]
        try {
            let _ = arr.slice(0, -1)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(true, true)
        }
    }

    @TestCase
    func testSliceOutOfBounds(): Unit {
        let arr = [1, 2, 3, 4, 5]
        try {
            let _ = arr.slice(3, 5)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(true, true)
        }
    }
}
