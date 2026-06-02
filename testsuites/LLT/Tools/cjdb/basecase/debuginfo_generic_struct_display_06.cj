// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct S<T> {
    func foo(f: T) {
        return 0
    }
}

main(): Int64 {
    var a = S<Int64>().foo(50)
    return 1
}
