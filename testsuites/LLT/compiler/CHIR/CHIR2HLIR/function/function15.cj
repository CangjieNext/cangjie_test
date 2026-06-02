// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var c = true
var d: Range<Int16> = 125..95
var f = g()
let h = ()
let j = true
let l = false

struct g {}

func ak() {
    func al() {
        f |> {
            ap: g => if (true) {
                var aq = 131..9
                for (i in aq) {}
            }
        }
    }
    al
}

main() {
    0
}
