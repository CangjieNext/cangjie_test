/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    public init<T>(x: T) {}
}

main() {
    A<Int64>(0)
    0
}
// ASSERT: scan sema_forbid_generic_constructor
// ASSERT: scan sema_generic_argument_no_match
