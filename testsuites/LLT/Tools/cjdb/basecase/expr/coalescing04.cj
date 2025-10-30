// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    let v1 = Option<Int64>.Some(100)
    let v2 = Option<UInt64>.Some(100)
    let v3 = Option<Float64>.Some(1.2)
    let v4 = Option<Bool>.Some(false)
    let v5 = Option<Rune>.Some(r'a')
    let v6 = Option<Unit>.Some(())
    let v7 = Option<Int64>.None

    let v11 = Option<Option<Int64>>.Some(Option<Int64>.Some(100))
    let v22 = Option<Option<UInt64>>.Some(Option<UInt64>.Some(100))
    let v33 = Option<Option<Float64>>.Some(Option<Float64>.Some(1.2))
    let v44 = Option<Option<Bool>>.Some(Option<Bool>.Some(false))
    let v55 = Option<Option<Rune>>.Some(Option<Rune>.Some(r'a'))
    let v66 = Option<Option<Unit>>.Some(Option<Unit>.Some(()))
    let v77 = Option<Option<Int64>>.None
    0
}
