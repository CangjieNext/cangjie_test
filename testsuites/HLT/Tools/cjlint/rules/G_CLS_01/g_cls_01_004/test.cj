/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Base1 {
    protected open func f(a: Int64): Int64 {
         return a
    }
}

interface Base2 {
    func f1(a: Int64): Int64 {
         return a
    }
}

class Sub <: Base1 & Base2 {
    public override func f(a: Int64): Int64 {
        super.f(a)
    }
}

main(){}

