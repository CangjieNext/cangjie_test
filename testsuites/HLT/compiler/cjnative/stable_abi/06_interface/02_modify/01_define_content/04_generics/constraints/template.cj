/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

public interface F1 { static func g() {1} }
public interface F2 { static func g() {1} }
public interface S1 <: F1 {}
public interface S2 <: S1 & F2 { static func g() {2} }
public interface I<T1, T2, T3> where T1 <: F1 & F2, T2 <: S1 {
    static func g(a: T1, b: T2) { 1 }
}
