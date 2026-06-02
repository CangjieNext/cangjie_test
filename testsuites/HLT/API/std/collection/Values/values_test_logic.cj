/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
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

class TestValue {
    public func testisEmpty(values: Collection<Int64>, exp_re: Bool): Int64 {
        var re = values.isEmpty()
        var size = values.size
        if (re == true && size == 0 && exp_re == true) {
            return 0
        } else if (re == false && exp_re == false) {
            return 0
        }
        return 1
    }
    public func testiterator(values: Collection<Int64>, exp_values: Array<Int64>): Int64 {
        var it = values.iterator()
        if (values.size != 0) {
            for (i in 0..values.size) {
                var act_value = it.next().getOrThrow()
                if (act_value != exp_values[i]) {
                    println("i=" + i.toString())
                    println("act_value=" + act_value.toString())
                    println("exp_values[i]=" + exp_values[i].toString())
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
