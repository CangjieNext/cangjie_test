/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package mp
public open class A {
    public open func foo() { 0 }
}
public class B <: A {
    public func foo() { 1 }
}
public common func f() { A() }
public func test_com() { f().foo() }
