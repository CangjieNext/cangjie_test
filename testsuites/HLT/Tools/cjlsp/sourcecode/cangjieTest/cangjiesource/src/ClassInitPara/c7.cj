/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.ClassInitPara

class C7<T, U> {
    var a: T
    var b: U
    init(a: T, b: U) {
        this.a = a
        this.b = b
    }
}

func test7() {
    var myC = C7(3, 4)
    myC.a
}
