// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import std.ast.*

public macro Outer(input: Tokens) {
    return input
}

func InnerCheck() {
    if (insideParentContext("outer")) {
        print("success")
    } else {
        print("fail")
    }
}

public macro Inner(input: Tokens) {
    InnerCheck()
    return input
}
