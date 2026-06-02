// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum C<T> {
    | X | Y
    static func coo(a: T) {
        a
    }
}

main() {
    let bb: UIntNative = 37
    C<UIntNative>.coo(bb)
    0
}
