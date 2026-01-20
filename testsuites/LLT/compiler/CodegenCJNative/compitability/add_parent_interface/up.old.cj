// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package shangyou.pkg1

import std.reflect.*

interface I1<T> {
    func f() {
        println(TypeInfo.of<T>().toString())
    }
}

public open class CA<T> {}

public func test(x: CA<Int64>) {
}