/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main(){
    let v1 = Option<Option<Int64>>.Some(Some(1))
    let v2 = Option<Option<Int64>>.None
    let v3 = Option<Option<UInt8>>.Some(Some(2))
    let v4 = Option<Option<UInt8>>.None
    let v5 = Option<Option<Float64>>.Some(Some(3.0))
    let v6 = Option<Option<Float64>>.None
    let v7 = Option<Option<Rune>>.Some(Some(r'A'))
    let v8 = Option<Option<Rune>>.None
    let v9 = Option<Option<String>>.Some(Some("abc"))
    let v10 = Option<Option<String>>.None

    let r1 = v1 ?? Some(3)
    let r2 = v2 ?? Some(3)
    let r3 = v3 ?? Some(3)
    let r4 = v4 ?? Some(3)
    let r5 = v5 ?? Some(6.0)
    let r6 = v6 ?? Some(6.0)
    let r7 = v7 ?? Some(r'B')
    let r8 = v8 ?? Some(r'B')
    let r9 = v9 ?? Some("hello")
    let r10 = v10 ?? Some("world")
    0
}
