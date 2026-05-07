// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC: %run %run_opt %output 2>&1

import std.collection.*

interface Canceler <: Hashable & Equatable<Canceler> {
    prop hash: Int64 {
        get() {
            0
        }
    }
    func hashCode(): Int64 {
        hash
    }
    operator func ==(other: Canceler): Bool {
        false
    }
}

class C <: Canceler {}

main() {
    var a = HashMap<Canceler, Unit>()
    0
}
