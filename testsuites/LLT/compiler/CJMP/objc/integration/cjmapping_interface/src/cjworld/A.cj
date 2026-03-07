/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import interoplib.objc.*
import objc.lang.*

public interface A {
    public func foo() : Unit
    public func goo(a: Int32, b:Int32) : Unit
    public func koo() : Int32
    public func hoo(a: Int32) : Int32
}
