// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

import b.define.*

class A<T> {
    @M
    private init() {
        print("macro_pass")
    }
    public init(input: T) {
        this()
    }
}

main() {
    A<Int64>(1)
    return 0
}
