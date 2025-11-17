/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main(){
    let v1 = Option<Int8>.Some(1)
    let v2 = Option<Int8>.None
    let v3 = Option<Int16>.Some(2)
    let v4 = Option<Int16>.None
    let v5 = Option<Int32>.Some(3)
    let v6 = Option<Int32>.None
    let v7 = Option<Int64>.Some(4)
    let v8 = Option<Int64>.None

    let r1 = v1 ?? 1
    let r2 = v2 ?? 2
    let r3 = v3 ?? 3
    let r4 = v4 ?? 4
    let r5 = v5 ?? 5
    let r6 = v6 ?? 6
    let r7 = v7 ?? 7
    let r8 = v8 ?? 8
    0
}
