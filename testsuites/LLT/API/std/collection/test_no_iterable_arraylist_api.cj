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
class ArrayListNonIteratorApiTest {
    var tmpList = ArrayList<String>()
    @TestCase
    func test_step() {
        var list = ArrayList<Int64>(10, {x: Int64 => x})
        @Expect(collectArray<Int64>(list |> step<Int64>(2)), list.step(2).toArray())
        @Expect(list.step(2).toArray(),[0,2,4,6,8])
        @Expect(list.step(1).toArray(),list.toArray())
    }

    @TestCase
    func test_take() {
        var list = ArrayList<Int64>(10, {x: Int64 => x})
        @Expect(collectArray<Int64>(list |> take<Int64>(2)), list.take(2).toArray())
        @Expect(list.take(2).toArray(),[0,1])
        @Expect(list.take(0).toArray(),[])
    }

    @TestCase
    func test_skip() {
        var list = ArrayList<Int64>(10, {x: Int64 => x})
        @Expect(collectArray<Int64>(list |> skip<Int64>(2)), list.skip(2).toArray())
        @Expect(list.skip(2).toArray(),[2,3,4,5,6,7,8,9])
        @Expect(list.skip(0).toArray(),list.toArray())
    }

    @TestCase
    func test_filter() {
        var list = ArrayList<Int64>(10, {x: Int64 => x})
        @Expect(collectArray<Int64>(list |> filter<Int64>({val: Int64 => val < 5})), list.filter({val: Int64 => val < 5}).toArray())
        @Expect(list.filter({val: Int64 => val < 5}).toArray(),[0,1,2,3,4])
    }

    @TestCase
    func test_map() {
        var list = ArrayList<Int64>(10, {x: Int64 => x})
        @Expect(collectArray(list.iterator() |> map<Int64,String>({val: Int64 => (val / 2).toString()})),list.map<String>({val: Int64 => (val / 2).toString()}).toArray())
        @Expect(list.map<String>({val: Int64 => (val / 2).toString()}).toArray(), Array<String>(10, {num: Int64 => (num / 2).toString()}))
    }

    @TestCase
    func test_filterMap() {
        var list = ArrayList<Int64>(10, {x: Int64 => x})
        @Expect(list.filterMap<String>({val: Int64 => if (val < 5){Some(val.toString())} else {None}}).toArray(),collectArray(list.iterator() |> filterMap<Int64,String>({val: Int64 => if (val < 5){Some(val.toString())} else {None}})))
        @Expect(list.filterMap<String>({val: Int64 => if (val < 5){Some(val.toString())} else {None}}).toArray(),["0","1","2","3","4"])
    }

    @TestCase
    func test_flatMap() {
        var list = ArrayList<ArrayList<Int64>>([ArrayList<Int64>([1, 2, 3]), ArrayList<Int64>([4, 5, 6])])
        @Expect(list.flatMap<String>({item => parseToString(item)}).toArray(),collectArray<String>(list |> flatMap<ArrayList<Int64>,String>({item => parseToString(item)})))
        @Expect(list.flatMap<String>({item => parseToString(item)}).toArray(),["2","3","4","5","6","7"])
    }

    func parseToString(arr: ArrayList<Int64>) {
        var res = ArrayList<String>()
        for (i in 0..arr.size) {
            res.add((arr[i] + 1).toString())
        }
        return res
    }

    @TestCase
    func test_intersperse() {
        var list = ArrayList<Int64>(5, {x: Int64 => x})
        @Expect(collectArray<Int64>(list.iterator().intersperse(8)), list.intersperse(8).toArray())
        @Expect(list.intersperse(8).toArray(),[0,8,1,8,2,8,3,8,4])
    }

    @TestCase
    func test_zip() {
        var list1 = ArrayList<Int64>(3, {x: Int64 => x})
        var list2 = ArrayList<String>(3, {x: Int64 => (x + 1).toString()})
        @Expect(collectHashMap<Int64,String>(list1.iterator() |> zip<Int64,String>(list2)), HashMap<Int64,String>(list1.zip<String>(list2).toArray()))
        @Expect(HashMap<Int64, String>([(0, "1"), (1, "2"), (2, "3")]), HashMap<Int64,String>(list1.zip<String>(list2).toArray()))
    }

    @TestCase
    func test_foreach() {
        var list = ArrayList<Int64>(5, {x: Int64 => x})
        list.forEach({item: Int64 => tmpList.add(item.toString())})
        @Expect(tmpList,ArrayList<String>(["0","1","2","3","4"]))
    }

    @TestCase
    func test_all() {
        var list1 = ArrayList<Int64>(5, {x: Int64 => x})
        var list2 = ArrayList<Int64>(5, {x: Int64 => x * 2})
        @Expect(list1.all({val: Int64 => (val % 2 == 0)}),false)
        @Expect(list2.all({val: Int64 => (val % 2 == 0)}),true)
    }

    @TestCase
    func test_any() {
        var list = ArrayList<Int64>(5, {x: Int64 => x})
        @Expect(list.any({val: Int64 => (val % 2 == 0)}),true)
        @Expect(list.any({val: Int64 => (val > 5)}),false)
    }

    @TestCase
    func test_none() {
        var list = ArrayList<Int64>(5, {x: Int64 => x})
        @Expect(list.none({val: Int64 => (val % 2 == 0)}),false)
        @Expect(list.none({val: Int64 => (val > 5)}),true)
    }

    @TestCase
    func test_fold() {
        var list = ArrayList<Int64>(5, {x: Int64 => x})
        @Expect(list.fold<Int64>(8,{a:Int64,b:Int64=> a + b}),8+0+1+2+3+4)
    }

    @TestCase
    func test_reduce() {
        var list = ArrayList<Int64>(5, {x: Int64 => x})
        @Expect(list.reduce({a:Int64,b:Int64=> a + b}),0+1+2+3+4)
    }
}
