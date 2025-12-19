// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

extend Int64 {
    func foo() {
        0
    }
}

main() {
    if (true) {
        return 0x1.foo()
    } else {
        return 0X1.foo()
    }
}
