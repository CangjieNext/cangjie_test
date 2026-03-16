// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: overload resolution with a lambda argument whose parameter types are
// omitted and flow through a tuple destructuring alias, where the constructor overloads
// differ in parameter types but share the same arity (both take a 2-parameter lambda).
// When the (Int64, Int64) -> Unit overload is declared before (String, String) -> Unit, the
// lambda body is still checked under the first candidate for diagnostics; the failure of
// inner(a) (whose type depends on the aliased lambda parameters but whose cache key does
// not) used to be written into the negative type-check cache and then hit by the
// (String, String) -> Unit candidate, rejecting it with "mismatched types: expected
// 'String', found 'Int64'". Unlike overload_resolution_6.cj, the candidates share the same
// arity, so the inner call is checked without a parameter-count mismatch.

func inner(v: String): Unit {}

class B {
    public init(list: (Int64, Int64) -> Unit) {}
    public init(list: (String, String) -> Unit) {}
}

main(): Int64 {
    B() {
        x, y =>
            let (a, b) = (x, y) // tuple destructuring alias
            inner(a) // depends on the type of a
            return
    }
    return 0
}
