/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: reduceLogic.cj
// EXEC: %compiler %cmp_opt %f reduceLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<Int64> = [2, 8, 9, 10, 25]
    var set1 = HashSet<String>(["dbada", "hjdga", "4242424", "中jhgd", "hjad"])
    var arraylist1 = ArrayList<Int16>([-1, 8, 9, 10, 25])

    var cases01 = [testIterableReduce<Int64>({
        item: Int64, r: Int64 => if (r == 8) {
            return r
        } else {
            return item + r
        }
    }, arr1, 52),
        testIterableReduce<Int64>({
        item: Int64, r: Int64 => if (r == 10) {
            return r
        } else {
            return item + r
        }
    }, arr1, 35),
        testIterableReduce<Int64>({
        item: Int64, r: Int64 => if (r == 25) {
            return r
        } else {
            return item + r
        }
    }, arr1, 25),
        testIterableReduce<Int64>({
        item: Int64, r: Int64 => if (r == 26) {
            return r
        } else {
            return item + r
        }
    }, arr1, 54),
        testIterableReduce<String>({
        item: String, r: String => if (r == "dbada") {
            return r
        } else {
            return item + r
        }
    }, set1, "dbadahjdga4242424中jhgdhjad"),
        testIterableReduce<String>({
        item: String, r: String => if (r == "4242424") {
            return r
        } else {
            return item + r
        }
    }, set1, "4242424中jhgdhjad"),
        testIterableReduce<String>({
        item: String, r: String => if (r == "hjad") {
            return r
        } else {
            return item + r
        }
    }, set1, "hjad"),
        testIterableReduce<String>({
        item: String, r: String => if (r == "ddddd") {
            return r
        } else {
            return item + r
        }
    }, set1, "dbadahjdga4242424中jhgdhjad"),
        testIterableReduce<Int16>({
        item: Int16, r: Int16 => if (r == 8) {
            return r
        } else {
            return item + r
        }
    }, arraylist1, Int16(52)),
        testIterableReduce<Int16>({
        item: Int16, r: Int16 => if (r == 10) {
            return r
        } else {
            return item + r
        }
    }, arraylist1, Int16(35)),
        testIterableReduce<Int16>({
        item: Int16, r: Int16 => if (r == 25) {
            return r
        } else {
            return item + r
        }
    }, arraylist1, Int16(25)),
        testIterableReduce<Int16>({
        item: Int16, r: Int16 => if (r == 26) {
            return r
        } else {
            return item + r
        }
    }, arraylist1, Int16(51))]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        return 1
    }
    return 0
}
