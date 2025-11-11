// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

<<<<<<< HEAD
// EXEC: %frontendCompiler %typecheck %diag_json %f 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
// ASSERT: scan sema_static_function_cannot_access_non_static_member
// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan "Errors": 3,
=======
// EXEC:%frontendCompiler %typecheck %diag_json %f 2>&1 | compare %f
>>>>>>> upstream/dev

enum A<T> {
    a(T)

    public static func foo() {
        test()
    }
    public func test() {}
}

class B {}

func test<T>() where T <: Option<B> {}

main(): Int64 {
    test<B>()
    return 1
}
<<<<<<< HEAD
=======

// ASSERT: scan-1 sema_generic_type_argument_not_match_constraint
// ASSERT: scan-1 sema_static_function_cannot_access_non_static_member
// ASSERT: scan-1 sema_upper_bound_must_be_class_or_interface
// ASSERT: scan "Errors": 3
>>>>>>> upstream/dev
