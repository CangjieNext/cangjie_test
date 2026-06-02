// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func test(ins: Collection<Int64>, size: Int64) {
    if (ins.isEmpty()) {
        return 1
    }
    if (ins.size != size) {
        return 2
    }
    var i = 0
    var ret = true
    let it = ins.iterator()
    while (true) {
        match (it.next()) {
            case Some(v) => ret = ret && (v == i)
            case None => break
        }
        i++
    }
    if (!ret || i != 3) {
        return 4
    }
    return 0
}

main() {
    var arr = Array<Int64>(3, {i => i})
    var res = test(arr, 3)
    if (res != 0) {
        return res
    }
    let ins: Collection<Int64> = arr
    res = test(arr, 3)
    if (res != 0) {
        return res
    }
    return 0
}
