/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main(){
    let v1 = Option<Rune>.Some(r'A')
    let v2 = Option<Rune>.None
    let v3 = Option<Range<Int64>>.Some(1..6)
    let v4 = Option<Range<Int64>>.None
    let v5 = Option<String>.Some("abc")
    let v6 = Option<String>.None

    let r1 = v1 ?? r'B'
    let r2 = v2 ?? r'C'
    let r3 = v3 ?? 1..2
    let r4 = v4 ?? 1..5
    let r5 = v5 ?? "hello"
    let r6 = v6 ?? "hello"
    let r7 = v5 ?? """
    abc
    """
    let r8 = v6 ??"#123#"
    0
}
