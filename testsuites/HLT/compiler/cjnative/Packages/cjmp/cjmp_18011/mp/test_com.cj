/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public open class A { public open func f() {1} }
public class B <: A { public func f() {2} }
public common class C {
    public init() {}
    public common func f(): A { A() }
}
