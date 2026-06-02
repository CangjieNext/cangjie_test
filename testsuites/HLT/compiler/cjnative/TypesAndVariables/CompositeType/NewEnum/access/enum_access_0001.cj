/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

var e1 = 0

enum E {
    e1(Int64)

    static func test() {
        return e1 is E
    }
}

main() {
    if (E.test()) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_enum_constructor_with_param_must_have_args
