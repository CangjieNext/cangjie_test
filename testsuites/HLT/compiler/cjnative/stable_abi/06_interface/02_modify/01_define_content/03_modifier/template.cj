/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test interface: access modifier
public interface I1 { static func g() {1} }
protected interface I2 { static func g() {1} }
internal interface I3 { static func g() {1} }
interface I4 { static func g() {1} }
private interface I5 { static func g() {1} }
sealed interface I6 { static func g() {1} }
public interface I7 { static func g() {1} }
public sealed interface I8 { static func g() {1} }
public func f() { return I2.g() + I3.g() + I4.g() + I5.g() }
