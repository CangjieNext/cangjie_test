/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.FuncOverload.pkg

public func f(a: Int64): Unit {}

public func f(a: Float64): Unit {}

public func f(a: Int64, b: Float64): Unit {}

func test() {
    var a = f(1)
    var b = f(2.2)
    var c = f(3, 4.4)
}
