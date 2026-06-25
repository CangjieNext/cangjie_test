// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A composition desugars to a lambda that calls both operands, so composing
// unsafe functions outside an unsafe context is rejected, same as the
// equivalent lambda. The composition emits one diagnostic (both synthesized
// calls share the source range), the lambda emits two.

// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-3 sema_unsafe_function_invoke_failed
// ASSERT: scan-not core dumped

unsafe func f(x: Int32): Float32 {
    Float32(x)
}

unsafe func g(x: Float32): Int32 {
    Int32(x)
}

main() {
    let composition = f ~> g
    let lambda = { x => g(f(x)) }
}
