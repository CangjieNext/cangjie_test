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
    var arr1: Array<Int32> = [8, 9, 10, 25, 18, 19, 120, 125]
    var arrlis1 = ArrayList<Int64>([8, 9, 10, 25, 18, 19, 120, 125])
    var set1 = HashSet<Int16>([8, 9, 10, 25, 18, 19, 120, 125])
    var casesresult1 = [testIterableAll<Int32>(arr1, {
        item: Int32 => if (item == 19) {
            return true
        } else {
            return false
        }
    }, false), testIterableAll<Int32>(arr1, {
        item: Int32 => if (item == 19) {
            return false
        } else {
            return true
        }
    }, false), testIterableAll<Int32>(arr1, {item: Int32 => return false}, false),
        testIterableAll<Int32>(arr1, {item: Int32 => return true}, true)]
    var casesresult2 = [testIterableAll<Int64>(arrlis1,
        {
            item: Int64 => if (item == 19) {
                return true
            } else {
                return false
            }
        }, false),
        testIterableAll<Int64>(arrlis1, {
        item: Int64 => if (item == 19) {
            return false
        } else {
            return true
        }
    }, false), testIterableAll<Int64>(arrlis1, {item: Int64 => return false}, false),
        testIterableAll<Int64>(arrlis1, {item: Int64 => return true}, true)]
    var casesresult3 = [testIterableAll<Int16>(set1, {
        item: Int16 => if (item == 19) {
            return true
        } else {
            return false
        }
    }, false), testIterableAll<Int16>(set1, {
        item: Int16 => if (item == 19) {
            return false
        } else {
            return true
        }
    }, false), testIterableAll<Int16>(set1, {item: Int16 => return false}, false),
        testIterableAll<Int16>(set1, {item: Int16 => return true}, true)]
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
