// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg2

internal import pkg1.*

public class A {
    var a: E<String>
    public init(v: A) {
        a = E1<String>("")
    }
    init() {
        a = E1<String>("")
    }

    public func test(): Unit {}
}

public func getA() {
    return A()
}
