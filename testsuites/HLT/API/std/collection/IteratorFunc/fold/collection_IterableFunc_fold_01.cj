/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: foldLogic.cj
// EXEC: %compiler %cmp_opt %f foldLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<Int8> = [25, 10, 9, 8]
    var set1 = HashSet<String>(["hjad", "中jhgd", "4242424", "hjdga", "dbada"])
    var arraylist1 = ArrayList<Int32>([25, 10, 9, 8])

    var cases01 = [testIterableFold<Int8, Int64>(2,
        {
            item: Int64, r: Int8 => if (r == 8) {
                return Int64(r)
            } else {
                return item + Int64(r)
            }
        }, arr1, 8),
        testIterableFold<Int8, Int64>(2,
        {
            item: Int64, r: Int8 => if (r == 10) {
                return Int64(r)
            } else {
                return item + Int64(r)
            }
        }, arr1, 27),
        testIterableFold<Int8, Int64>(2,
        {
            item: Int64, r: Int8 => if (r == 25) {
                return Int64(r)
            } else {
                return item + Int64(r)
            }
        }, arr1, 52),
        testIterableFold<Int8, Int64>(2,
        {
            item: Int64, r: Int8 => if (r == 26) {
                return Int64(r)
            } else {
                return item + Int64(r)
            }
        }, arr1, 54),
        testIterableFold<String, String>("start",
        {
            item: String, r: String => if (r == "dbada") {
                return r
            } else {
                return item + r
            }
        }, set1, "dbada"),
        testIterableFold<String, String>("start",
        {
            item: String, r: String => if (r == "4242424") {
                return r
            } else {
                return item + r
            }
        }, set1, "4242424hjdgadbada"),
        testIterableFold<String, String>("start",
        {
            item: String, r: String => if (r == "hjad") {
                return r
            } else {
                return item + r
            }
        }, set1, "hjad中jhgd4242424hjdgadbada"),
        testIterableFold<String, String>("start",
        {
            item: String, r: String => if (r == "ddddd") {
                return r
            } else {
                return item + r
            }
        }, set1, "starthjad中jhgd4242424hjdgadbada"),
        testIterableFold<Int32, Int16>(-1,
        {
            item: Int16, r: Int32 => if (r == 8) {
                return Int16(r)
            } else {
                return item + Int16(r)
            }
        }, arraylist1, Int16(8)),
        testIterableFold<Int32, Int16>(-1,
        {
            item: Int16, r: Int32 => if (r == 10) {
                return Int16(r)
            } else {
                return item + Int16(r)
            }
        }, arraylist1, Int16(27)),
        testIterableFold<Int32, Int16>(-1,
        {
            item: Int16, r: Int32 => if (r == 25) {
                return Int16(r)
            } else {
                return item + Int16(r)
            }
        }, arraylist1, Int16(52)),
        testIterableFold<Int32, Int16>(-1,
        {
            item: Int16, r: Int32 => if (r == 26) {
                return Int16(r)
            } else {
                return item + Int16(r)
            }
        }, arraylist1, Int16(51))]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        for (i in cases01) {
            println(i)
        }
        return 1
    }
    return 0
}
