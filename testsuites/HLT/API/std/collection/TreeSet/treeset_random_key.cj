/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.collection.*
import std.random.*

@Test
class Test_treemap_01 {
    
    @TestCase
    func test_01(): Unit {
        var ts = TreeSet<Int64>()
        let rm = Random(54)
        let size= 100
        for(_ in 0..size) {
            ts.add(Int64(rm.nextUInt8()))
        }
        var arr = ArrayList<Int64>()
        var res = 0
        for(i in ts) {
            arr.add(i)
        }
        for(i in 1..arr.size) {
            if(arr[i] == arr[i-1]) {
                res = 1
            }
        }
        @Expect(res,0)
    }
}

