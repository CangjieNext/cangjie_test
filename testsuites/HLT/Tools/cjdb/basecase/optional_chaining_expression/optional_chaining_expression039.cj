/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

let gfoo = {i:Int64 => i+1}
let gf1 = Option<(Int64) -> Int64>.Some(gfoo)
let gf2 = Option<(Int64) -> Int64>.None
let gr3 = gf1?(1)
let gr4 = gf2?(1)

main() {
    let foo = {i:Int64 => i+1}
    let f1 = Option<(Int64) -> Int64>.Some(foo)
    let f2 = Option<(Int64) -> Int64>.None
    let r3 = f1?(1)
    let r4 = f2?(1)
    0
}