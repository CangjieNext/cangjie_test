// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test case for issue: Compiler crashes with Internal Compiler Error when generic type 
// is used without generic_object_configuration configuration
// Expected behavior: Compiler should report an error instead of crashing

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %enable_java_cjmapping %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f

package issue

import interoplib.interop.*

public class Generic<T> {
    private let _t: T
    public init(t: T) { _t = t }
    public func get(): T { _t }
}

/* SCAN-IN
error: generic type 'Generic' used in Java interop must be configured in generic_object_configuration
*/
