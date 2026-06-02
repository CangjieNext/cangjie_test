/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class MyError <: StackOverflowError {}

main() {
    try {
        throw MyError()
    } catch (_: Error) {
        print("catch!")
    } finally {
        print("finally!")
    }
    return 0
}
// ASSERT: scan sema_no_match_function_declaration_for_call
// ASSERT: scan sema_non_inheritable_super_class
