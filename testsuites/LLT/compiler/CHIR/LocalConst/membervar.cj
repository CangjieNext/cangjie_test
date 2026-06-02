// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output

class A<T> {
    let foo = {
        =>
        const func bar(): Int64 {
            1
        }
        const a = bar()
        a
    }()
}

main() {
    A<Int64>().foo - A<String>().foo
}
