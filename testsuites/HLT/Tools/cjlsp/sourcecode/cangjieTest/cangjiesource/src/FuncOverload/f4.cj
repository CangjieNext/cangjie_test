/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.FuncOverload

struct R {
    R(var a!: Int64, var b!: Float64) {
        this.a = a
        this.b = b
    }
    init(a: Int64) {
        this.a = a
        b = 1.1
    }
}

func test4() {
    var a = R(a: 1, b: 2.2).a
    var b = R(1).b

}
