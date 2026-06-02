// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import define.*

@M3
class A {
    func testA() {
        let a = 1
        let b = 2
        return a + b
    }
}

main() {
    A().testA()
}
