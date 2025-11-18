/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

let gv1 = Option<Int64>.Some(100)
let gv2 = Option<Int64>.None
let gr1 = gv1 ?? 1
let gr2 = gv2 ?? 2


func test1() {
    let v1 = Option<Int64>.Some(100)
    let v2 = Option<Int64>.None
    let r1 = v1 ?? 3
    let r2 = v2 ?? 4
}

main(){
    test1()
    0
}
