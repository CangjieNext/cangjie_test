// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct B<T> {
    func bar(a: T) {
        a
    }
}

main() {
    var aa = B<UInt64>()
    let bb: UInt64 = 36
    aa.bar(bb)
    0
}
