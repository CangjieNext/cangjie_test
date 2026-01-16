/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

open common class A {
    public common open func f(): Unit {
        println("I am superclass")
    }
}

class B <: A {
    public override func f(): Unit {
        println("I am subclass")
    }
}
