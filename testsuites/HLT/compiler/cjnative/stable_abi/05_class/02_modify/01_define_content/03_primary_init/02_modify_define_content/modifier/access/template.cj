/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

public class C1 { public C1(public let v!: Int64 = 0) {} }
public class C2 { protected C2(public let v!: Int64 = 0) {} }
public class C3 { internal C3(public let v!: Int64 = 0) {} }
public class C4 { private C4(public let v!: Int64 = 0) {} }
public class C5 { C5(public let v!: Int64 = 0) {} }


