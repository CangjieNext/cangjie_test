/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package A.a

public open class BB {}

protected class Foo <: BB {
    var a = 1
}

extend Foo {
    func test() {
        1
    }
}
