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
class TreeMapNonIteratorApiTest {
    var tmpList = ArrayList<String>()
    @TestCase
    func test_mapValues() {
        var map = TreeMap<String,Int64>([("1",1),("2",2),("3",3)])
        var m = map.mapValues<String>({k:String,v:Int64 => k + (v + 1).toString()})
        println(m.toString())
        @Expect(map.mapValues<String>({k:String,v:Int64 => k + (v + 1).toString()}),TreeMap<String,String>([("1","12"),("2","23"),("3","34")]))
    }

    @TestCase
    func test_mapValues2() {
        var map = TreeMap<String,Int64>([("1",1),("2",2),("3",3)])
        @Expect(map.mapValues<String>({v:Int64 => (v + 1).toString()}),TreeMap<String,String>([("1","2"),("2","3"),("3","4")]))
    }

    @TestCase
    func test_filter() {
        var map = TreeMap<String,Int64>([("1",1),("2",2),("3",3)])
        @Expect(map.filter({k:String,v:Int64=> k != "1" && v <= 2}),TreeMap<String,Int64>([("2",2)]))
    }

    @TestCase
    func test_forEach(){
        var map = TreeMap<String,Int64>([("1",1),("2",2),("3",3)])
        map.forEach({k:String,v:Int64=> tmpList.add(k + v.toString())})
        @Expect(tmpList.toArray(),["11","22","33"])
    }

    @TestCase
    func test_all(){
        var map = TreeMap<String,Int64>([("1",1),("2",2),("3",3)])
        @Expect(map.all({k:String,v:Int64=> k.size >= 1 && v >= 1}),true)
    }

    @TestCase
    func test_any(){
        var map = TreeMap<String,Int64>([("1",1),("2",2),("3",3)])
        @Expect(map.any({k:String,v:Int64=> k.size >= 1 && v >= 2}),true)
        @Expect(map.any({k:String,v:Int64=> k.size >= 1 && v > 3}),false)
    }

    @TestCase
    func test_none(){
        var map = TreeMap<String,Int64>([("1",1),("2",2),("3",3)])
        @Expect(map.none({k:String,v:Int64=> k.size >= 1 && v >= 2}),false)
        @Expect(map.none({k:String,v:Int64=> k.size >= 1 && v > 3}),true)
    }

    @TestCase
    func test_fold() {
        var map = TreeMap<String,Int64>([("1",1),("2",2),("3",3)])
        @Expect(map.fold<Int64>(8,{r:Int64,k:String,v:Int64=> r + v + k.size}),17)
    }

    @TestCase
    func test_reduce() {
        var map = TreeMap<String,Int64>([("1",1),("2",2),("3",3)])
        @Expect(map.reduce({v1:Int64,v2:Int64=> v1 + v2}),6)
    }
}
