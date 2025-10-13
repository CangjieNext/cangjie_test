import fm.*

@car
class P {
    public let f: String = "nothing"
}

func foo(): String {
    let a = "have" + " " + P().f
    return a
}

main() {
    println(foo())
}

// ASSERT: scan have nothing


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
