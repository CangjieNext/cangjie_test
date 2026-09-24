/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Base {
    protected open func f(a: Int64): Int64 {
        return a
    }
}

class Sub <: Base {
    protected override func f(a: Int64): Int64 {
        return a + 1
    }
}

main() {
    let s = Sub()
    println(s.f(1))
}
