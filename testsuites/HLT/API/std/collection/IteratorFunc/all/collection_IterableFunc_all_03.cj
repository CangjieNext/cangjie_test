/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj allLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj allLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1 = [A(9), A(10), A(11)]
    var arrlist1 = ArrayList<B>([B(9), B(10), B(11)])
    var set1 = HashSet<C>([C(9), C(10), C(11)])
    var casesresult1 = [testIterableAll<A>(arr1, {
        item: A => if (item == A(9)) {
            return true
        } else {
            return false
        }
    }, false), testIterableAll<A>(arr1, {
        item: A => if (item == A(9)) {
            return false
        } else {
            return true
        }
    }, false), testIterableAll<A>(arr1, {item: A => return false}, false),
        testIterableAll<A>(arr1, {item: A => return true}, true)]
    var casesresult2 = [testIterableAll<B>(arrlist1, {
        item: B => if (item == B(9)) {
            return true
        } else {
            return false
        }
    }, false), testIterableAll<B>(arrlist1, {
        item: B => if (item == B(9)) {
            return false
        } else {
            return true
        }
    }, false), testIterableAll<B>(arrlist1, {item: B => return false}, false),
        testIterableAll<B>(arrlist1, {item: B => return true}, true)]
    var casesresult3 = [testIterableAll<C>(set1, {
        item: C => if (item == C(9)) {
            return true
        } else {
            return false
        }
    }, false), testIterableAll<C>(set1, {
        item: C => if (item == C(9)) {
            return false
        } else {
            return true
        }
    }, false), testIterableAll<C>(set1, {item: C => return false}, false),
        testIterableAll<C>(set1, {item: C => return true}, true)]
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
