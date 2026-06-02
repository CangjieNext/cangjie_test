// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f 

class A {
    func foo() {
        const func bar(): Int64 {
            1
        }
        const a = bar()
        a
    }

    func goo<T>() {
        const func bar<E>(): Int64 {
            1
        }
        const a = bar<T>()
        a
    }
}

main() {
    A().foo() - A().goo<Int64>()
}
