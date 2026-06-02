/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: anyLogic.cj
// EXEC: %compiler %cmp_opt %f anyLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1 = Array<String>()
    var arrlis1 = ArrayList<Rune>()
    var set1 = HashSet<Float64>()
    var casesresult1 = [testIterableAny<String>(arr1,
        {
            item: String => if (item == "19") {
                return true
            } else {
                return false
            }
        }, false),
        testIterableAny<String>(arr1, {
        item: String => if (item == "19") {
            return false
        } else {
            return true
        }
    }, false), testIterableAny<String>(arr1, {item: String => return false}, false),
        testIterableAny<String>(arr1, {item: String => return true}, false)]
    var casesresult2 = [testIterableAny<Rune>(arrlis1,
        {
            item: Rune => if (item == r'1') {
                return true
            } else {
                return false
            }
        }, false),
        testIterableAny<Rune>(arrlis1, {
        item: Rune => if (item == r'1') {
            return false
        } else {
            return true
        }
    }, false), testIterableAny<Rune>(arrlis1, {item: Rune => return false}, false),
        testIterableAny<Rune>(arrlis1, {item: Rune => return true}, false)]
    var casesresult3 = [testIterableAny<Float64>(set1,
        {
            item: Float64 => if (item == Float64(19)) {
                return true
            } else {
                return false
            }
        }, false),
        testIterableAny<Float64>(set1, {
        item: Float64 => if (item == Float64(19)) {
            return false
        } else {
            return true
        }
    }, false), testIterableAny<Float64>(set1, {item: Float64 => return false}, false),
        testIterableAny<Float64>(set1, {item: Float64 => return true}, false)]
    var resultExpexct1 = Array<Int64>(casesresult1.size, repeat: 0)
    var resultExpexct2 = Array<Int64>(casesresult2.size, repeat: 0)
    var resultExpexct3 = Array<Int64>(casesresult3.size, repeat: 0)
    if (casesresult1 != resultExpexct1) {
        return 1
    }
    if (casesresult2 != resultExpexct2) {
        return 2
    }
    if (casesresult3 != resultExpexct3) {
        return 3
    }
    return 0
}
