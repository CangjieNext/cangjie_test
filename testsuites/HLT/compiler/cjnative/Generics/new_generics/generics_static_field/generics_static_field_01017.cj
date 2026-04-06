/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

// ASSERT: scan sema_static_variable_use_generic_parameter

struct S<T> {
    static var a = {
        =>
        var x: Option<T>
        0
    }()
}

main() {
    return S<Int64>.a
}
