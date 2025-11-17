/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public open common class A {
    public common init()
}

protected open common class A2 <: A{
    public common init()
}

public sealed abstract common class A3{
    public common init()
}

sealed common class A4{
    public common init()
}

public func test_com() { A() }