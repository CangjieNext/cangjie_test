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
class TreeSetNonIteratorApiTest {
    var tmpList = ArrayList<String>()
    @TestCase
    func test_map() {
        var set = TreeSet<Int64>([1,2,3])
        @Expect(set.map<String>({item:Int64 => item.toString()}),TreeSet<String>(["1","2","3"]))
    }

    @TestCase
    func test_filter() {
        var set = TreeSet<Int64>([1,2,3])
        @Expect(set.filter({item:Int64 => item > 1}),TreeSet<Int64>([2,3]))
    }

    @TestCase
    func test_filterMap() {
        var set = TreeSet<Int64>([1,2,3,4,5])
        @Expect(set.filterMap<String>({val: Int64 => if (val < 3){Some(val.toString())} else {None}}),TreeSet<String>(["1","2"]))
    }

    @TestCase
    func test_forEach(){
        var set = TreeSet<Int64>([1,2,3,4,5])
        set.forEach({item:Int64 => tmpList.add(item.toString())})
        @Expect(tmpList.toArray(),["1","2","3","4","5"])
    }

    @TestCase
    func test_all(){
        var set = TreeSet<Int64>([1,2,3,4,5])
        @Expect(set.all({item:Int64 => item < 6}),true)
    }

    @TestCase
    func test_any(){
        var set = TreeSet<Int64>([1,2,3,4,5])
        @Expect(set.any({item:Int64 => item > 6}),false)
    }

    @TestCase
    func test_none(){
        var set = TreeSet<Int64>([1,2,3,4,5])
        @Expect(set.none({item:Int64 => item > 6}),true)
    }

    @TestCase
    func test_fold() {
        var set = TreeSet<Int64>([1,2,3,4,5])
        @Expect(set.fold<Int64>(8,{a:Int64,b:Int64=> a + b}),8+1+2+3+4+5)
    }

    @TestCase
    func test_reduce() {
        var set = TreeSet<Int64>([1,2,3,4,5])
        @Expect(set.reduce({a:Int64,b:Int64=> a + b}),1+2+3+4+5)
    }
}
