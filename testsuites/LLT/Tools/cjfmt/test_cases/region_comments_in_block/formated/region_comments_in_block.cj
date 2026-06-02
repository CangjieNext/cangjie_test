// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// REGION: 1:100
func a() {
    while (true) {}
    while (true) { /*1*/ }

    while (true) {
        // 2
    }

    while (true) {
        // 3
        false
        // comment
    }

    let arr = [
        // comment
    ]

    let arr = [
        // comment
        false
        //comment
    ]

    b(
        // comment
    )

    b(
        /*comment*/ )
    b( /*comment*/ )
    b(
        false,
        // comment
        true,
        // comment
    )

    b // comment 
    ()

    b = // tuple
        (1, 2)

    arr = // comment
        []

    while (true) // comment 
    {}
}
