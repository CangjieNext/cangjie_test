/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.FuncOverload

interface I6 {
    func f6(a: Int64) {}
}

class C6 <: I6 {
    func f6(a: Float32) {}
}

func test7() {
    var a = C6().f6(1)
    var b = C6().f6(2.2)

}
