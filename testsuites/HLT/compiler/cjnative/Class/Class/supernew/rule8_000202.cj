/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

class Test<T, U> {
    public Test() {
        Test<T, U>()
    }
}

class Test1<T, U> {
    public init() {
        Test1<T, U>()
    }
}

class Test2<T, U> {
    public Test2() {
        this()
    }
}

class Test3<T, U> {
    public init() {
        this()
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_recursive_constructor_call
// ASSERT: scan sema_illegal_place_of_calling_this_primary_constructor
