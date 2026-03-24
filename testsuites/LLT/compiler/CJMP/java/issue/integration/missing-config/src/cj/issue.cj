/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package issue

import interoplib.interop.*

// Test case for issue: Compiler crashes when lambda_patterns, tuple_configuration, 
// or generic_object_configuration is missing for a package with APIStrategy = "Full"
// Expected behavior: Compiler should report errors instead of crashing with:
//   - std::bad_alloc (for function type)
//   - null pointer (for tuple type)
//   - Internal Compiler Error (for generic type)

// Test 1: Function type without lambda_patterns configuration
public class FuncType {
    private let _f: (Int64) -> Int64
    public init(f: (Int64) -> Int64) { _f = f }
    public func apply(x: Int64): Int64 { _f(x) }
}

// Test 2: Tuple type without tuple_configuration configuration
public class TupleType {
    private let _t: (Int64, Int64)
    public init(t: (Int64, Int64)) { _t = t }
    public func get(): (Int64, Int64) { _t }
}

// Test 3: Generic type without generic_object_configuration configuration
public class Generic<T> {
    private let _t: T
    public init(t: T) { _t = t }
    public func get(): T { _t }
}
