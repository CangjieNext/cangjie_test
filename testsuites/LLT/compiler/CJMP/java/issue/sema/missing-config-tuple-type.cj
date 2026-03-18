// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test case for issue: Compiler crashes with null pointer error when tuple type 
// is used without tuple_configuration configuration
// Expected behavior: Compiler should report an error instead of crashing

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %enable_java_cjmapping %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f

package issue

import interoplib.interop.*

public class TupleType {
    private let _t: (Int64, Int64)
    public init(t: (Int64, Int64)) { _t = t }
    public func get(): (Int64, Int64) { _t }
}

/* SCAN-IN
error: tuple type 'Tuple<Int64, Int64>' used in Java interop must be configured in tuple_configuration
*/
