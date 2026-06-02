// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import define.*

@M
class A {
    func test1() {
        @A2
        var a = 1
        var b = @Me(2)
        return a + b
    }
}
