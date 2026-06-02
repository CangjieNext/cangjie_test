/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    public func test(a: T) {
        print("A_first")
    }
    public func test(a: T) {
        print("A_second")
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_overload_conflicts
