/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package returnType

struct Foo40 {
    var i = 0

    public mut func g() {
        i += 1  // Ok
    }
}

func test40() {
    var a = Foo40()
    a
}
