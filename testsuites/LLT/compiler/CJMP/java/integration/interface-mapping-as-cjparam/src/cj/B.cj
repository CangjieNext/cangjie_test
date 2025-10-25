/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cj
 
import interoplib.interop.*
 
public struct B {
    public func hoo(a : A) : Unit {
        a.foo()
        println("goo(5) from java:" + a.goo(5).toString())
   }
}