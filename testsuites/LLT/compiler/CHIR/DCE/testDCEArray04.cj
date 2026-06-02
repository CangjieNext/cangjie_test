// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan invalid subscript operator [] on type 'Struct-Array<Class-A>'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class B {
    var x = 1
}

class A {
    func test() {
        return B()
    }
}

func abc() {
    println(123)
    return 2
}

main() {
    var x =  [A()]
    x[return  0]
    .
    test()
    .
    x
    =
    abc()
   0
}