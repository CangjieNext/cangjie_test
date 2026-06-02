/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test<T>(input: Int64) {
    func test(a: T) {}
    test(1)
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_no_match_function_declaration_for_call
// ASSERT: scan sema_unable_to_infer_generic_func
