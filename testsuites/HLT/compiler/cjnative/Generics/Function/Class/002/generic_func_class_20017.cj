/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<X> {
    public func test(x: X): X {
        println("a");
        x
    }
    public func test<T>(x: X): X {
        println("b");
        x
    }
}

main() {
}
// ASSERT: scan sema_overload_conflicts
