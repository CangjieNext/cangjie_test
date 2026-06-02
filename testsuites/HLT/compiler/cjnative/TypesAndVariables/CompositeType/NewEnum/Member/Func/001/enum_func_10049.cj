/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1

enum A<T> {
    a(T)

    protected static func foo() {
        0
    }
    public func test() {
        A<Int64>.foo()
    }
}

main(): Int64 {
    return a(1).test()
}
