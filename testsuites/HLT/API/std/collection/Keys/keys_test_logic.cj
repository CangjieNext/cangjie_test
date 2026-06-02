/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
import std.collection.*

func casetrue(s: String): Bool {
    if (s == "a") {
        return true
    }
    return false
}

func casefalse(s: String): Bool {
    if (s == "f") {
        return true
    }
    return false
}

class TestKeys {
    public func testcontains(keys: EquatableCollection<String>, key: String, exp_re: Bool): Int64 {
        var act_re = keys.contains(key)
        if (act_re != exp_re) {
            return 1
        }
        return 0
    }
    public func testcontainsAll(keys: EquatableCollection<String>, testkeys: Collection<String>, exp_re: Bool): Int64 {
        var act_re = keys.contains(all: testkeys)
        if (act_re != exp_re) {
            return 1
        }
        return 0
    }
    public func testisEmpty(keys: EquatableCollection<String>, exp_re: Bool): Int64 {
        var re = keys.isEmpty()
        var size = keys.size
        if (re == true && size == 0 && exp_re == true) {
            println("size_9")
            return 0
        }
        if (re == false && exp_re == false) {
            println("size_10")
            return 0
        }
        println("size_11")
        println("re=" + re.toString())
        println("exp_re=" + exp_re.toString())
        println("size=" + size.toString())
        return 1
    }
    public func testiterator(keys: EquatableCollection<String>, exp_keys: Array<String>): Int64 {
        var it = keys.iterator()
        if (keys.size != 0) {
            for (i in 0..keys.size) {
                var act_key = it.next().getOrThrow()
                if (act_key != exp_keys[i]) {
                    println("i=" + i.toString())
                    println("act_key=" + act_key.toString())
                    println("exp_keys[i]=" + exp_keys[i].toString())
                    return 1
                }
            }
            return 0
        } else {
            try {
                it.next().getOrThrow()
            } catch (e: NoneValueException) {
                return 0
            }
            return 2
        }
    }
}
