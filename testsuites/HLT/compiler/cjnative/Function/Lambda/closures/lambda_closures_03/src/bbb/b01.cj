/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package bbb

public var foo1: (()-> Int32) -> Int32 = {x: () -> Int32 => return x()}
var a: Int32 = 1
public var foo2: (()-> Int32) -> Int32 = {x: () -> Int32 => return x() + a}
var foo3 = {x: () -> Int32 => return x()}
public var foo4: (()-> Int32) -> Int32 = {x: () -> Int32 => return x() + foo3({=> 3})}
