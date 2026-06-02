/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_static_variable_use_generic_parameter



class C<T> {
    static const a: String = ""
    var b: ?T = None<T>
    static const c: ?T = None<T>
}

main(): Int64 {
    let c0 = C<Int64>()
    if (C<String>.a == "" && c0.b.isNone() && C<Byte>.c.isNone()) {
        return 0
    }
    return 1
}
