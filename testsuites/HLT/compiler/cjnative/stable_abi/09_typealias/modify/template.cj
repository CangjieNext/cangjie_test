/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test typeAlias: modify typeAlias
type Mytype1 = Int64
type Mytype2 = Int32
public type Mytype3 = Float64
public type Mytype4 = Float32
public var a: Mytype1 = 1
var b: Mytype2 = 2
public var c: Mytype3 = 1.1
var d: Mytype4 = 2.2


