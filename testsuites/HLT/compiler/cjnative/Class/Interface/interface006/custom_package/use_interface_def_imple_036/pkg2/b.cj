/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public class myClass <: MyInterface1<Int64> & MyInterface2<Int64> & MyInterface3<Int64> {
    public var x: Int64 = 10
    public func foo1() {
        x = 20
        1
    }
    public func foo2() {
        x = 30
        2
    }
    public func foo3() {
        x = 40
        3
    }
    public func foo4() {
        x
    }
    public func foo5() {
        x
    }
    public func foo6() {
        x
    }
}
