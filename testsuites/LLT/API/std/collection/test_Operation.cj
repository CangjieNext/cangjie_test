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

var emptyArr1: Array<Int64> = Array<Int64>()
var normalArr1: Array<Int64> = Array<Int64>(10, {val => val * 2})
var emptyArr2: Array<(Int64, Int64)> = Array<(Int64, Int64)>()
var normalArr2: Array<(Int64, Int64)> = Array<(Int64, Int64)>(10, {val => (val, val * 2)})
var bufferArrList1: ArrayList<Int64> = ArrayList<Int64>()
var tmpArr: Array<Int64> = Array<Int64>(10, {val => val * 2})

@Test
class OperationTest {
    @TestCase
    func transform(): Unit {
        var collectStringFunc = collectString<Int64>(delimiter: ", ")
        @Expect(collectStringFunc(emptyArr1.iterator()), "")
        @Expect(collectArray(emptyArr1.iterator()), [])
        @Expect(collectArrayList(emptyArr1.iterator()), ArrayList<Int64>())
        @Expect(collectHashSet(emptyArr1.iterator()), HashSet<Int64>())
        @Expect(collectHashMap(emptyArr2.iterator()), HashMap<Int64, Int64>())

        @Expect(collectStringFunc(normalArr1.iterator()), "0, 2, 4, 6, 8, 10, 12, 14, 16, 18")
        @Expect(collectArray(normalArr1.iterator()), Array<Int64>(10, {val => val * 2}))
        @Expect(collectArrayList(normalArr1.iterator()), ArrayList<Int64>(10, {val => val * 2}))
        @Expect(collectHashSet(normalArr1.iterator()), HashSet<Int64>(10, {val => val * 2}))
        @Expect(collectHashMap(normalArr2.iterator()), HashMap<Int64, Int64>(10, {val => (val, val * 2)}))
    }

    @TestCase
    func end(): Unit {
        emptyArr1 |> forEach<Int64>({
            item: Int64 => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), emptyArr1)
        bufferArrList1.clear()
        normalArr1 |> forEach<Int64>({
            item: Int64 => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), normalArr1)
        bufferArrList1.clear()

        @Expect(isEmpty(emptyArr1))
        @Expect(!isEmpty(normalArr1))

        @Expect(count(emptyArr1), 0)
        @Expect(count(normalArr1), 10)

        @Expect(!(emptyArr1 |> contains(2)))
        @Expect(!(normalArr1 |> contains(-1)))
        @Expect(normalArr1 |> contains(2))

        @Expect(max<Int64>(emptyArr1), None)
        @Expect(max<Int64>(normalArr1).getOrThrow(), 18)

        @Expect(min<Int64>(emptyArr1), None)
        @Expect(min<Int64>(normalArr1).getOrThrow(), 0)

        @Expect(emptyArr1 |> all<Int64>({val: Int64 => (val % 2 == 0)}))
        @Expect(normalArr1 |> all<Int64>({val: Int64 => (val % 2 == 0)}))

        @Expect(!(emptyArr1 |> any<Int64>({val: Int64 => (val == 0)})))
        @Expect(normalArr1 |> any<Int64>({val: Int64 => (val == 0)}))

        @Expect(emptyArr1 |> none<Int64>({val: Int64 => (val == 0)}))
        @Expect(normalArr1 |> none<Int64>({val: Int64 => (val % 2 == 1)}))

        @Expect(first<Int64>(emptyArr1), None)
        @Expect(first<Int64>(normalArr1).getOrThrow(), 0)

        @Expect(last<Int64>(emptyArr1), None)
        @Expect(last<Int64>(normalArr1).getOrThrow(), 18)

        @Expect(emptyArr1 |> at<Int64>(0), None)
        @Expect((normalArr1 |> at<Int64>(5)).getOrThrow(), 10)

        var foldFunc = {
            val: String, item: Int64 => if (val == "reduce") {
                "${item}"
            } else {
                "${val},${item}"
            }
        }
        var reduceFunc = {
            val: Int64, item: Int64 => val + item
        }

        @Expect(emptyArr1 |> fold<Int64, String>("reduce", foldFunc), "reduce")
        @Expect(normalArr1 |> fold<Int64, String>("reduce", foldFunc), "0,2,4,6,8,10,12,14,16,18")

        @Expect(emptyArr1 |> reduce<Int64>(reduceFunc), None)
        @Expect(normalArr1 |> reduce<Int64>(reduceFunc), Some(90))
    }

    @TestCase
    func endDotNotation(): Unit {
        emptyArr1.iterator().forEach({
            item: Int64 => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), emptyArr1)
        bufferArrList1.clear()
        normalArr1.iterator().forEach({
            item: Int64 => bufferArrList1.add(item)
        })
        @Expect(bufferArrList1.toArray(), normalArr1)
        bufferArrList1.clear()
        @Expect(isEmpty(emptyArr1))
        @Expect(!isEmpty(normalArr1))

        @Expect(emptyArr1.iterator().count(), 0)
        @Expect(normalArr1.iterator().count(), 10)
        @Expect(!emptyArr1.iterator().contains(2))
        @Expect(!normalArr1.iterator().contains(-1))
        @Expect(normalArr1.iterator().contains(2))

        @Expect(emptyArr1.iterator().max(), None)
        @Expect(normalArr1.iterator().max().getOrThrow(), 18)

        @Expect(emptyArr1.iterator().min(), None)
        @Expect(normalArr1.iterator().min().getOrThrow(), 0)

        @Expect(emptyArr1.iterator().all({val: Int64 => (val % 2 == 0)}))
        @Expect(normalArr1.iterator().all({val: Int64 => (val % 2 == 0)}))
        @Expect(!normalArr1.iterator().all({val: Int64 => (val % 2 == 1)}))

        @Expect(!emptyArr1.iterator().any({val: Int64 => (val == 0)}) )
        @Expect(normalArr1.iterator().any({val: Int64 => (val == 0)}) )

        @Expect(emptyArr1.iterator().none({val: Int64 => (val == 0)}) )
        @Expect(normalArr1.iterator().none({val: Int64 => (val % 2 == 1)}) )

        @Expect(emptyArr1.iterator().first(), None)
        @Expect(normalArr1.iterator().first().getOrThrow(), 0)

        @Expect(emptyArr1.iterator().last(), None)
        @Expect(normalArr1.iterator().last().getOrThrow(), 18)

        @Expect(emptyArr1.iterator().at(0), None)
        @Expect(normalArr1.iterator().at(5).getOrThrow(), 10)

        var foldFunc = {
            val: String, item: Int64 => if (val == "reduce") {
                "${item}"
            } else {
                "${val},${item}"
            }
        }

        var reduceFunc = {
            val: Int64, item: Int64 => val + item
        }

        @Expect(emptyArr1.iterator().reduce(reduceFunc), None)
        @Expect(normalArr1.iterator().reduce(reduceFunc), Some(90))

        @Expect(emptyArr1.iterator().fold<String>("reduce", foldFunc), "reduce")
        @Expect(normalArr1.iterator().fold<String>("reduce", foldFunc), "0,2,4,6,8,10,12,14,16,18")
    }

    @TestCase
    func middle(): Unit {
        @Expect(collectHashMap<Int64, Int64>(enumerate(emptyArr1)), HashMap<Int64, Int64>())
        @Expect(collectHashMap<Int64, Int64>(enumerate(normalArr1)), HashMap<Int64, Int64>(normalArr2))

        var collectStringFunc = collectString<Int64>(delimiter: ",")
        @Expect(collectStringFunc(emptyArr1 |> filter({val: Int64 => val < 5})), "")
        @Expect(collectStringFunc(normalArr1 |> filter({val: Int64 => val < 5})), "0,2,4")

        @Expect(collectArray(emptyArr1 |> map<Int64, String>({val: Int64 => (val / 2).toString()})), Array<String>())
        @Expect(collectArray(normalArr1 |> map<Int64, String>({val: Int64 => (val / 2).toString()})),
            Array<String>(10, {num: Int64 => num.toString()}))

        @Expect(collectArray(emptyArr1 |> filterMap<Int64, String>({val: Int64 => if (val < 5){Some(val.toString())} else {None}})), Array<String>())
        @Expect(collectArray(normalArr1 |> filterMap<Int64, String>({val: Int64 => if (val < 5){Some(val.toString())} else {None}})), Array<String>(3, {num: Int64 => normalArr1[num].toString()}))

        collectArray(tmpArr |> inspect<Int64>({val: Int64 => tmpArr[val / 2] += 1}))
        @Expect(tmpArr, Array<Int64>(10, {num: Int64 => num * 2 + 1}))

        let arr1: Array<Array<Int64>> = [[1, 2, 3], [], [4, 5, 6], [], [1, 2, 3], [], [], [1, 2, 3]]
        @Expect(collectArray<Int64>(flatten<Array<Int64>,Int64>(arr1)), [1, 2, 3, 4, 5, 6, 1, 2, 3, 1, 2, 3])

        @Expect(collectArray<Int64>(arr1 |> flatMap<Array<Int64>, Int64>({item => item})),
            [1, 2, 3, 4, 5, 6, 1, 2, 3, 1, 2, 3])

        let arr2: Array<Int64> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let arr3: Array<String> = ["4", "5", "6"]
        @Expect(collectHashMap<Int64, String>(arr2 |> zip<Int64, String>(arr3)),
            HashMap<Int64, String>([(0, "4"), (1, "5"), (2, "6")]))

        let arr4 = [0, 1, 2, 3]
        let arr5 = [4, 5, 6, 7, 8, 9]
        @Expect(collectArray<Int64>(arr4 |> concat<Int64>(arr5)), arr2)

        @Expect(collectArray<Int64>(arr2 |> skip<Int64>(3)), [3, 4, 5, 6, 7, 8, 9])
        @Expect(collectArray<Int64>(arr2 |> skip<Int64>(10)), [])
        try {
            arr2 |> skip<Int64>(-1)
            @Expect("Should throw exception", "arr2 |> skip<Int64>(-1)")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Skip count cannot less than 0!")
        }

        @Expect(collectArray<Int64>(arr2 |> take<Int64>(3)), [0, 1, 2])
        @Expect(collectArray<Int64>(arr2 |> take<Int64>(10)), arr2)
        try {
            arr2 |> take<Int64>(-1)
            @Expect("Should throw exception", "arr2 |> skip<Int64>(-1)")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Take count cannot less than 0!")
        }

        @Expect(collectArray<Int64>(arr2 |> step<Int64>(2)), [0, 2, 4, 6, 8])
        @Expect(collectArray<Int64>(arr2 |> step<Int64>(1)), arr2)
        try {
            arr2 |> step<Int64>(0)
            @Expect("Should throw exception", "arr2 |> skip<Int64>(-1)")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Step count must be greater than 0!")
        }

        try {
            arr2 |> step<Int64>(-1)
            @Expect("Should throw exception", "arr2 |> skip<Int64>(-1)")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Step count must be greater than 0!")
        }
    }

    @TestCase
    func middleDotNotation(): Unit {
        @Expect(collectHashMap<Int64, Int64>(enumerate(emptyArr1)), HashMap<Int64, Int64>())
        @Expect(collectHashMap<Int64, Int64>(enumerate(normalArr1)), HashMap<Int64, Int64>(normalArr2))

        var collectStringFunc = collectString<Int64>(delimiter: ",")

        @Expect(collectStringFunc(emptyArr1.iterator().filter({val: Int64 => val < 5})), "")
        @Expect(collectStringFunc(normalArr1.iterator().filter({val: Int64 => val < 5})), "0,2,4")

        @Expect(collectArray(emptyArr1.iterator().map<String>({val: Int64 => (val / 2).toString()})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().map<String>({val: Int64 => (val / 2).toString()})),
            Array<String>(10, {num: Int64 => num.toString()}))

        @Expect(collectArray(emptyArr1.iterator().filterMap<String>({val: Int64 =>
            if (val < 5){Some(val.toString())} else {None}})), Array<String>())
        @Expect(collectArray(normalArr1.iterator().filterMap<String>({val: Int64 =>
            if (val < 5){Some(val.toString())} else {None}})),
            Array<String>(3, {num: Int64 => normalArr1[num].toString()}))

        collectArray(tmpArr.iterator().inspect({val: Int64 => tmpArr[val / 2] -= 1}))
        @Expect(tmpArr, Array<Int64>(10, {num: Int64 => num * 2 }))

        let arr1: Array<Array<Int64>> = [[1, 2, 3], [], [4, 5, 6], [], [1, 2, 3], [], [], [1, 2, 3]]
        @Expect(collectArray<Int64>(flatten<Array<Int64>,Int64>(arr1)), [1, 2, 3, 4, 5, 6, 1, 2, 3, 1, 2, 3])

        @Expect(collectArray<Int64>(arr1.iterator().flatMap<Int64>({ item => item.iterator()})),
            [1, 2, 3, 4, 5, 6, 1, 2, 3, 1, 2, 3])

        let arr2: Array<Int64> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let arr3: Array<String> = ["4", "5", "6"]
        @Expect(collectHashMap<Int64, String>(arr2.iterator().zip<String>(arr3.iterator())),
            HashMap<Int64, String>([(0, "4"), (1, "5"), (2, "6")]))

        let arr4 = [0, 1, 2, 3]
        let arr5 = [4, 5, 6, 7, 8, 9]
        @Expect(collectArray<Int64>(arr4.iterator().concat(arr5.iterator())), arr2)

        @Expect(collectArray<Int64>(arr2.iterator().skip(3)), [3, 4, 5, 6, 7, 8, 9])
        @Expect(collectArray<Int64>(arr2.iterator().skip(10)), [])
        try {
            arr2.iterator().skip(-1)
            @Expect("Should throw exception", "arr2 |> skip<Int64>(-1)")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Skip count cannot less than 0!")
        }

        @Expect(collectArray<Int64>(arr2.iterator().take(3)), [0, 1, 2])
        @Expect(collectArray<Int64>(arr2.iterator().take(10)), arr2)
        try {
            arr2.iterator().take(-1)
            @Expect("Should throw exception", "arr2 |> skip<Int64>(-1)")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Take count cannot less than 0!")
        }

        @Expect(collectArray<Int64>(arr2.iterator().step(2)), [0, 2, 4, 6, 8])
        @Expect(collectArray<Int64>(arr2.iterator().step(1)), arr2)
        try {
            arr2.iterator().step(0)
            @Expect("Should throw exception", "arr2 |> skip<Int64>(-1)")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Step count must be greater than 0!")
        }

        try {
            arr2.iterator().step(-1)
            @Expect("Should throw exception", "arr2 |> skip<Int64>(-1)")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Step count must be greater than 0!")
        }
    }
}
