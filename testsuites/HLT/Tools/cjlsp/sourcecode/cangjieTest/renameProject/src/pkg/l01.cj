/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

let _f1: (Int64, Int64) -> Int64 = {
    aa: Int64, b: Int64 => aa + b
}
var sum1: (Int32, Int32) -> Int32 = {a, b => a + b}
var display = { => print("Hllo")}
let d1 = sum1(1, 2)

let _r1 = {a: Int64, b: Int64 => a + b}(1, 2)
