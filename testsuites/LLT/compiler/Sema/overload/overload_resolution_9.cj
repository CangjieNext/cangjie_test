// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: overload resolution with a lambda argument whose parameter types are
// omitted and flow through a tuple destructuring alias, where the constructor overloads
// differ in parameter types but share the same arity (both take a 2-parameter lambda).
// Unlike overload_resolution_6.cj, the candidates share the same arity, so the inner call
// is checked on type compatibility alone (expected 'String' vs found 'Int64') rather than
// a parameter-count mismatch.

func inner(v: String): Unit {}

class B {
    public init(list: (Int64, Int64) -> Unit) {}
    public init(list: (String, String) -> Unit) {}
}

main(): Int64 {
    B() {
        x, y =>
            let (a, b) = (x, y)
            inner(a)
            return
    }
    return 0
}
