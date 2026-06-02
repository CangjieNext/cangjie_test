// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output

func foo(paramAA: Unit, paramBB!: Int64): Bool {
    false
}

func goo(): Unit {
    do {
        1
    } while (foo(
        while (true) {
            ()
        },
        paramBB: match ([1]) {
            case _ => 1
        }
    ))
}

main() {
    goo()
}
