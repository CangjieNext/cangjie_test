/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

public interface I1 { static func g1() {1} }
public interface I2 { static func g2() {1} }
public interface I3 { static func g3() {1} }
public interface I4 <: I1 & I2 { static func g4() {1} }
public func f() { I3.g3() }
