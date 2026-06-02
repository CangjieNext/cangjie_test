// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A<T> {}

extend<T> A<Option<T>> {
    static func foo() {
        func goo(b: T) {
            var c = b
        }
    }
}

main() {
    var b = A<Option<Bool>>.foo
    b()
}
