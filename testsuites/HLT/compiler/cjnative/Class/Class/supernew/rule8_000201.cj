/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

abstract class Test {
    public Test() {
        Test()
    }
}

abstract class Test1 {
    public init() {
        Test1()
    }
}

abstract class Test2 {
    public Test2() {
        this()
    }
}

abstract class Test3 {
    public init() {
        this()
    }
}

main(): Int64 {
    return 0;
}
// ASSERT: scan sema_abstract_class_can_not_be_instantiated
// ASSERT: scan sema_recursive_constructor_call
// ASSERT: scan sema_illegal_place_of_calling_this_primary_constructor
