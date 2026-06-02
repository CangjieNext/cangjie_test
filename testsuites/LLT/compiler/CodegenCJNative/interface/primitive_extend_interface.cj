// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface Eqq {
    func g(): String
}

extend Int64 <: Eqq {
    public func g() {
        this.toString()
    }
}

main() {
    var a = Int64(456)
    var b: Eqq = a
    if (b.g() != "456") {
        return 1
    }
    return 0
}
