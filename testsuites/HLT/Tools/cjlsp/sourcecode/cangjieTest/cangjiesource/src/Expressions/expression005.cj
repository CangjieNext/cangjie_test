/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Expressions

open class Person {
    var aa = 2
    init() {
        this.aa = 2
    }
}

class Student <: Person {
    init() {
        this.aa = super.aa
    }
}
