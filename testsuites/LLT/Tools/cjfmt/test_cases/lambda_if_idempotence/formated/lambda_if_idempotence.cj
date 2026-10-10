// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package repro

func f(): (Bool) -> Int64 {
    {
        v: Bool => if (v) {
            1
        } else {
            0
        }
    }
}

func f(x: ?Bool): ?Unit {
    x.map({
        v => if (v) {
            println("x")
        }
    })
}

func f(x: ?Bool): ?Int64 {
    x.map({
        v => match (v) {
            case true => 1
            case false => 0
        }
    })
}

func f(): Int64 {
    apply(1, {
        v: Bool => if (v) {
            1
        } else {
            0
        }
    })
}
