/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
import std.collection.*

func casetrue(s: Int64): Bool {
    if (s == 10) {
        return true
    }
    return false
}

func casefalse(s: Int64): Bool {
    if (s == 11) {
        return true
    }
    return false
}

class TestSet {
    public func testcontains(sets: Set<Int64>, setvalue: Int64, exp_re: Bool): Int64 {
        var act_re = sets.contains(setvalue)
        if (act_re != exp_re) {
            return 1
        }
        return 0
    }
    public func testcontainsAll(sets: Set<Int64>, testvalues: Collection<Int64>, exp_re: Bool): Int64 {
        var act_re = sets.contains(all: testvalues)
        if (act_re != exp_re) {
            return 1
        }
        return 0
    }
    public func testsubsetOf(sets: Set<Int64>, testsets: Set<Int64>, exp_re: Bool): Int64 {
        var act_re = sets.contains(all: testsets)
        if (act_re != exp_re) {
            return 1
        }
        return 0
    }
    public func testremove(sets: Set<Int64>, testkey: Int64): Int64 {
        var size1 = sets.size
        var size2 = 0
        if (sets.contains(testkey) == true) {
            var act_re = sets.remove(testkey)
            size2 = sets.size
            if (size2 == size1 - 1) {
                println("size1=" + size2.toString())
                return 0
            }
            return 1
        }
        if (sets.contains(testkey) == false) {
            var act_re = sets.remove(testkey)
            size2 = sets.size
            if (size2 == size1) {
                println("size3=" + size2.toString())
                return 0
            }
            return 2
        }
        return 3
    }
    public func testremoveAll(sets: Set<Int64>, testsets: Collection<Int64>): Int64 {
        var size1 = sets.size
        sets.remove(all: testsets)
        for (i in testsets) {
            if (sets.contains(i) == true) {
                return 2
            }
        }
        return 0
    }
    public func testremoveIf(sets: Set<Int64>, s: (Int64) -> Bool, exp_size: Int64): Int64 {
        sets.removeIf(s)
        var act_size = sets.size
        println("act_size=" + act_size.toString())
        if (act_size != exp_size) {
            return 1
        }
        return 0
    }
    public func testClear(sets: Set<Int64>): Int64 {
        sets.clear()
        var re = sets.isEmpty()
        var size = sets.size
        if (re == true && size == 0) {
            return 0
        }
        return 1
    }
    public func testretainAll(sets: Set<Int64>, testsets: Set<Int64>, exp_sets: Set<Int64>): Int64 {
        sets.retain(all: testsets)
        if (sets.contains(all: exp_sets) && exp_sets.contains(all: sets)) {
            return 0
        }
        return 1
    }
    public func testadd(sets: Set<Int64>, setvalue: Int64): Int64 {
        sets.add(setvalue)
        if (sets.contains(setvalue) != true) {
            return 1
        }
        return 0
    }
    public func testputAll(sets: Set<Int64>, testvalues: Collection<Int64>): Int64 {
        sets.add(all: testvalues)
        if (sets.contains(all: testvalues) != true) {
            return 1
        }
        return 0
    }
}
