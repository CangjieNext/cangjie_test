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
class ArrayNonIteratorApiTest {
    var tmpList = ArrayList<String>()
    @TestCase
    func test_step() {
        var list = Array<Int64>(10, {x: Int64 => x})
        @Expect(collectArray<Int64>(list |> step<Int64>(2)), list.step(2).toArray())
        @Expect(list.step(2).toArray(),[0,2,4,6,8])
        @Expect(list.step(1).toArray(),list.toArray())
    }

    @TestCase
    func test_take() {
        var arr = Array<Int64>(10, {x: Int64 => x})
        @Expect(collectArray<Int64>(arr |> take<Int64>(2)), arr.take(2).toArray())
        @Expect(arr.take(2).toArray(),[0,1])
        @Expect(arr.take(0).toArray(),[])
    }

    @TestCase
    func test_skip() {
        var arr = Array<Int64>(10, {x: Int64 => x})
        @Expect(collectArray<Int64>(arr |> skip<Int64>(2)), arr.skip(2))
        @Expect(collectArray<Int64>(arr |> skip<Int64>(0)), arr.skip(0))
        @Expect(collectArray<Int64>(arr |> skip<Int64>(10)), arr.skip(10))
        @Expect(collectArray<Int64>(arr |> skip<Int64>(11)), arr.skip(11))
        @Expect(arr.skip(2),[2,3,4,5,6,7,8,9])
        @Expect(arr.skip(0),arr)
    }

    @TestCase
    func test_filter() {
        var list = Array<Int64>(10, {x: Int64 => x})
        @Expect(collectArray<Int64>(list |> filter<Int64>({val: Int64 => val < 5})), list.filter({val: Int64 => val < 5}))
        @Expect(list.filter({val: Int64 => val < 5}),[0,1,2,3,4])
    }

    @TestCase
    func test_map() {
        var arr = Array<Int64>(10, {x: Int64 => x})
        @Expect(collectArray(arr.iterator() |> map<Int64,String>({val: Int64 => (val / 2).toString()})),arr.map<String>({val: Int64 => (val / 2).toString()}))
        @Expect(arr.map<String>({val: Int64 => (val / 2).toString()}).toArray(), Array<String>(10, {num: Int64 => (num / 2).toString()}))
    }

    @TestCase
    func test_filterMap() {
        var arr = Array<Int64>(10, {x: Int64 => x})
        @Expect(arr.filterMap<String>({val: Int64 => if (val < 5){Some(val.toString())} else {None}}),collectArray(arr |> filterMap<Int64,String>({val: Int64 => if (val < 5){Some(val.toString())} else {None}})))
        @Expect(arr.filterMap<String>({val: Int64 => if (val < 5){Some(val.toString())} else {None}}),["0","1","2","3","4"])
    }

    @TestCase
    func test_flatMap() {
        var arr: Array<Array<Int64>> = [[1, 2, 3], [4, 5, 6]]
        @Expect(arr.flatMap<String>({item => parseToString(item)}),collectArray<String>(arr |> flatMap<Array<Int64>,String>({item => parseToString(item)})))
        @Expect(arr.flatMap<String>({item => parseToString(item)}),["2","3","4","5","6","7"])
    }

    func parseToString(arr: Array<Int64>) {
        var res = Array<String>(arr.size, repeat: "")
        for (i in 0..arr.size) {
            res[i] = (arr[i] + 1).toString()
        }
        return res
    }

    @TestCase
    func test_intersperse() {
        var arr = Array<Int64>(5, {x: Int64 => x})
        @Expect(collectArray<Int64>(arr.iterator().intersperse(8)), arr.intersperse(8))
        @Expect(arr.intersperse(8),[0,8,1,8,2,8,3,8,4])
    }

    @TestCase
    func test_zip() {
        var arr1 = Array<Int64>(3, {x: Int64 => x})
        var arr2 = Array<String>(3, {x: Int64 => (x + 1).toString()})
        @Expect(collectHashMap<Int64,String>(arr1.iterator() |> zip<Int64,String>(arr2)), HashMap<Int64,String>(arr1.zip<String>(arr2)))
        @Expect(HashMap<Int64, String>([(0, "1"), (1, "2"), (2, "3")]), HashMap<Int64,String>(arr1.zip<String>(arr2)))
    }

    @TestCase
    func test_foreach() {
        var arr = Array<Int64>(5, {x: Int64 => x})
        arr.forEach({item: Int64 => tmpList.add(item.toString())})
        @Expect(tmpList.toArray(),["0","1","2","3","4"])
    }

    @TestCase
    func test_all() {
        var arr1 = Array<Int64>(5, {x: Int64 => x})
        var arr2 = Array<Int64>(5, {x: Int64 => x * 2})
        @Expect(arr1.all({val: Int64 => (val % 2 == 0)}),false)
        @Expect(arr2.all({val: Int64 => (val % 2 == 0)}),true)
    }

    @TestCase
    func test_any() {
        var arr = Array<Int64>(5, {x: Int64 => x})
        @Expect(arr.any({val: Int64 => (val % 2 == 0)}),true)
        @Expect(arr.any({val: Int64 => (val > 5)}),false)
    }

    @TestCase
    func test_none() {
        var arr = Array<Int64>(5, {x: Int64 => x})
        @Expect(arr.none({val: Int64 => (val % 2 == 0)}),false)
        @Expect(arr.none({val: Int64 => (val > 5)}),true)
    }

    @TestCase
    func test_fold() {
        var arr = Array<Int64>(5, {x: Int64 => x})
        @Expect(arr.fold<Int64>(8,{a:Int64,b:Int64=> a + b}),8+0+1+2+3+4)
    }

    @TestCase
    func test_reduce() {
        var arr = Array<Int64>(5, {x: Int64 => x})
        @Expect(arr.reduce({a:Int64, b:Int64=> a+ b}),0+1+2+3+4)
    }
}
