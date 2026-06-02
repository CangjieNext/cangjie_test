// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output

func foo(a: Int64): Nothing {
    throw Exception()
}

let bar: (Nothing) -> Int64 = foo

main() {
    bar(throw Exception())
    let jack: (Nothing) -> Int64 = foo
    jack(throw Exception())
    0
}
