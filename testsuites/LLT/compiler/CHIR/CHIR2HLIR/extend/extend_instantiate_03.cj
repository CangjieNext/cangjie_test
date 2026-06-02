// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// Test for generic instantiation ptr re-arrange for extend constraints in upper bound.
func collectionToString<T, R>(it: R): Int64 where R <: Collection<T>, T <: ToString {
    let i = it.iterator()
    var count = 0
    while (true) {
        let x = i.next()
        match (x) {
            case Some(v) => count++
            case _ => break
        }
    }
    return count
}

main() {
    var p = Array<Int64>(10, repeat: 0)
    if (collectionToString<Int64, Array<Int64>>(p) != 10) {
        return 1
    }
    return 0
}
