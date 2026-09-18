// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.macro.cj
// EXEC: %compiler %cmp_macro %n.macro.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import make_local_macro.*

@MakeLocal
class Holder {
    var label: Int64 = 0

    Holder(s: Int64) {
        label = s
    }

    init() {
        label = 1
    }

    func id(s: Int64): Int64 {
        s
    }

    static func wrap(s: Int64): Int64 {
        s
    }
}

@MakeLocal
func freeId(s: Int64): Int64 {
    s
}

main() {
    let h0 = Holder(3)
    let h = Holder() @local!
    let a = h.id(2)
    let b = Holder.wrap(4)
    let c = freeId(5)
    if (a + b + c + h0.label == 2 + 4 + 5 + 3) {
        println("ok")
    }
}
