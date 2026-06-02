// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum E<T> {
    defaultA | defaultB
}

func foo<T>(para: E<T>) {
    var a = para
    var b = a
    b = E<T>.defaultA
}

main() {
    foo<Int64>(E<Int64>.defaultB)
    return 0
}
