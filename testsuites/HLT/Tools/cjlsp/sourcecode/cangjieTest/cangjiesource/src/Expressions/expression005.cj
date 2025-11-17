package default.Expressions

open class A {
    var aa = 2
    init() {
        this.aa = 2
    }
}

class B <: A {
    init() {
        this.aa = super.aa
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
