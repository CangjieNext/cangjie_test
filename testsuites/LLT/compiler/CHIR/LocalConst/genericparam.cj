// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f --int-overflow=wrapping -Woff unused -o %output

const func foo(): Bool { // block id: 155
    const func bar<T0, T1>(p1: T0, p2!: UInt8 = 97): String { // block id: 221
        "jNLc\"n|y6d"
    }

    bar<Rune, Float64>(r'4', p2: 97)

    true
}

const func foo1(): String {
    const func bar<T0, T1>(p1: Option<T0>, p2!: UInt8 = 97): String {
        ""
    }
    bar<String, Int64>(Some("1"))
}

main() {}
