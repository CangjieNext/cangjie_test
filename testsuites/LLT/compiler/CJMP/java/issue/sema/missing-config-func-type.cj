// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test case for issue: Compiler crashes with std::bad_alloc when function type 
// is used without lambda_patterns configuration
// Expected behavior: Compiler should report an error instead of crashing

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %enable_java_cjmapping %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f

package issue

import interoplib.interop.*

public class FuncType {
    private let _f: (Int64) -> Int64
    public init(f: (Int64) -> Int64) { _f = f }
    public func apply(x: Int64): Int64 { _f(x) }
}

/* SCAN-IN
error: function type '(Int64) -> Int64' used in Java interop must be configured in lambda_patterns
*/
