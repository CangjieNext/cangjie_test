/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package mp

public interface I1 {
    func f1() { 1 }
}
public interface I2 {
    func f2() { -1 }
}
public common class A <: I1 & I2 {
    public static var a1 = 1
    public var a2 = -1
    public common init() {}
}
public func test_com() { A.a1 + A().a2 + A().f1() + A().f2() }


