/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package mp

open class C {
    public static prop p: Int64 { get() { 1 } }
}
public common class A <: C {
    public init(){}

    public common static prop p: Int64
}
public func test_com() { A.p }


