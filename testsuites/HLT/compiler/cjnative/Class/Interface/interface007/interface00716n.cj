/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I {
    static func test<T>(a: T): T where T <: I {
        return a
    }
}

main(): Int64 {
    return I.test<Bool>(true)
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
