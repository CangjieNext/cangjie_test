// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_static_function_overload_conflicts
// ASSERT: scan the error originates in the macro `M1` (consider using `--debug-macro` for more info)


import define.*

class A {}

@M1
extend A {
    public static func f(a: Int8) {}
    public func f() {}
}

main() {}
