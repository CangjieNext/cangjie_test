/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: allLogic.cj
// EXEC: %compiler %cmp_opt %f allLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    let a1: Array<UInt16> = [1, 2]
    let aa1: Array<Array<UInt16>> = [a1, a1]
    let aa2: Array<Array<UInt16>> = [a1]
    let aaa1: Array<Array<Array<UInt16>>> = [aa1, aa2] //complex 1
    let h1 = HashSet<UInt64>([3, 4])
    let h2 = HashSet<UInt64>([3, 5])
    let ah1: Array<HashSet<UInt64>> = [h1, h1]
    let ah2: Array<HashSet<UInt64>> = [h1, h2]
    let lah1 = ArrayList<Array<HashSet<UInt64>>>([ah1, ah2]) //complex 2
    let lah2 = ArrayList<Array<HashSet<UInt64>>>([ah2]) //complex 2
    let llah1 = ArrayList<ArrayList<Array<HashSet<UInt64>>>>([lah1, lah2]) //complex 3
    let llah2 = ArrayList<ArrayList<Array<HashSet<UInt64>>>>([lah2]) //complex 3
    let lllah1 = ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>([llah1, llah2])
    let lllah2 = ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>([llah2])
    let alllah1: Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>> = [lllah1, lllah2]
    let alllah2: Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>> = [lllah2]
    let aalllah1: Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>> = [alllah1, alllah2]
    let aalllah2: Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>> = [alllah1]
    let laalllah1 = ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>(
        [aalllah1, aalllah2])
    let laalllah2 = ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>([aalllah2])
    let alaalllah1: Array<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>> = [laalllah1,
        laalllah2] //complex 4
    var casesresult1 = [testIterableAll<Array<Array<UInt16>>>(aaa1,
        {
            item: Array<Array<UInt16>> => if (item == aa1) {
                return true
            } else {
                return false
            }
        }, false),
        testIterableAll<Array<Array<UInt16>>>(aaa1,
        {
            item: Array<Array<UInt16>> => if (item == aa1) {
                return false
            } else {
                return true
            }
        }, false), testIterableAll<Array<Array<UInt16>>>(aaa1, {item: Array<Array<UInt16>> => return false}, false),
        testIterableAll<Array<Array<UInt16>>>(aaa1, {item: Array<Array<UInt16>> => return true}, true)]
    var casesresult2 = [testIterableAll<Array<HashSet<UInt64>>>(lah1,
        {
            item: Array<HashSet<UInt64>> => if (item == ah1) {
                return true
            } else {
                return false
            }
        }, false),
        testIterableAll<Array<HashSet<UInt64>>>(lah1,
        {
            item: Array<HashSet<UInt64>> => if (item == ah1) {
                return false
            } else {
                return true
            }
        }, false), testIterableAll<Array<HashSet<UInt64>>>(lah1, {item: Array<HashSet<UInt64>> => return false}, false),
        testIterableAll<Array<HashSet<UInt64>>>(lah1, {item: Array<HashSet<UInt64>> => return true}, true)]
    var casesresult3 = [testIterableAll<ArrayList<Array<HashSet<UInt64>>>>(llah1,
        {
            item: ArrayList<Array<HashSet<UInt64>>> => if (item == lah1) {
                return true
            } else {
                return false
            }
        }, false),
        testIterableAll<ArrayList<Array<HashSet<UInt64>>>>(llah1,
        {
            item: ArrayList<Array<HashSet<UInt64>>> => if (item == lah1) {
                return false
            } else {
                return true
            }
        }, false),
        testIterableAll<ArrayList<Array<HashSet<UInt64>>>>(llah1,
        {item: ArrayList<Array<HashSet<UInt64>>> => return false}, false),
        testIterableAll<ArrayList<Array<HashSet<UInt64>>>>(llah1,
        {item: ArrayList<Array<HashSet<UInt64>>> => return true}, true)]
    var casesresult4 = [testIterableAll<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>(
        alaalllah1,
        {
            item: ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>> => if (item ==
                laalllah1) {
                return true
            } else {
                return false
            }
        }, false),
        testIterableAll<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>(alaalllah1,
        {
            item: ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>> => if (item ==
                laalllah1) {
                return false
            } else {
                return true
            }
        }, false),
        testIterableAll<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>(alaalllah1,
        {item: ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>> => return false}, false),
        testIterableAll<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>(alaalllah1,
        {item: ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>> => return true}, true)]
    var resultExpexct1 = Array<Int64>(casesresult1.size, repeat: 0)
    var resultExpexct2 = Array<Int64>(casesresult2.size, repeat: 0)
    var resultExpexct3 = Array<Int64>(casesresult3.size, repeat: 0)
    var resultExpexct4 = Array<Int64>(casesresult4.size, repeat: 0)
    if (casesresult1 != resultExpexct1) {
        return 1
    }
    if (casesresult2 != resultExpexct2) {
        return 2
    }
    if (casesresult3 != resultExpexct3) {
        return 3
    }
    if (casesresult4 != resultExpexct4) {
        return 4
    }
    return 0
}
