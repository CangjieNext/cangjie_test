// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A<T> {}

extend<T> A<T> {
    public func foo() {
        return 15
    }
}

main() {
    let a: A<Int32> = A<Int32>()
    if (a.foo() == 15) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
