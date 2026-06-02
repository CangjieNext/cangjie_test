/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package mp

public common interface A {
    common static func f1(): Int64 { 1 }
    common func f2(): Int64 { -1 }
}
public class C <: A {}
public func test_com() { C.f1() + C().f2() }


