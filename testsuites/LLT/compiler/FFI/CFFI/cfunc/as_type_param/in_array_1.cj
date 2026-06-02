// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %f -o %n.%suffix
// EXEC: %run %n.%suffix

func getCFunc(flag: Bool): Option<CFunc<() -> Int8>> {
    if (!flag) {
        return None
    }
    var f: CFunc<() -> Int8> = { =>
        println("wow")
        return Int8(0)
    }
    return f
}

unsafe main() {
    var opt1 = getCFunc(false)
    var opt2 = getCFunc(true)
    match (opt1) {
        case Some(f) => f()
        case None => ()
    }
    match (opt2) {
        case Some(f) => f()
        case None => ()
    }

    var arr = Array<CFunc<() -> Int8>>()
    0
}
