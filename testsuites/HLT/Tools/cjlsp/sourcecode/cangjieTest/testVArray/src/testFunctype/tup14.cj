/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testFunctype

func f14(a: (p1: Float64) -> Float64) {}

func printAdd(add!: (p1: Int64, p2: Int64) -> Int64 = {i: Int64, j: Int64 => i * 5}): Unit {}

func printAdd(add: (p1: Int64, p2: Int64) -> Int64, a: Int64, b: Int64): Unit {}
