/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package mp

public platform class A {}
extend A <: I1 & I2 {}
public func test_plat() { A.a1 + A().a2 + A().f1() + A().f2() }


