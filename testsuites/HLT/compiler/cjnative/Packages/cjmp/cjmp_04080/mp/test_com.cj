/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package mp

open class C {
    public static func f(): Int64 { 1 }
}
public common class A <: C {
    public init(){}

    public common redef static func f(): Int64
}
public func test_com() { A.f() }


