/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    let arr = Array<Int64>(3,{i:Int64 => i*2})
    let a1 = Option<Array<Int64>>.Some(arr)
    let a2 = Option<Array<Int64>>.None
    let r1 = a1?[2]
    let r2 = a2?[2]
    0
}
