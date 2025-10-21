/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pipeline

//泛型函数
func c1<T>(a: T) {}
let j1_new: Int64 = 1
var j2 = j1_new |> c1
var j3 = true |> c1
