/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

interface I4 {
    mut func f1(): Unit
    func f2(): Unit
}

struct R4 <: I4 {
    public mut func f1(): Unit {}
    public func f2(): Unit {}
}

func test4() {
    var a = R4()
    var a2 = a.f1()
    var b: I4 = R4()
    var b1 = b.f1

}
