/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test import: delete import
import std.ast.*
import std.collection.*
public import std.math.*
public import std.fs.*

let list = ArrayList<Int64>([-2,-1,0,1,2])
public var a : Int64 = abs(list[0] + list[1] +list[2] + list[3] + list[4])


