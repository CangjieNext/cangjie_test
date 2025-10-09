// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop %enable_java_cjmapping 2>& 1 | compare %f

import java.lang.*
import interoplib.interop.*

public struct X {
    private var val: Int32 = 0
    public init() {}

    public func fooOpt(x: ?X): Int32 {
        return x?.val ?? -1
    }
}

/* SCAN-IN
error: argument type of cangjie mirror decl type member function is not supported
*/
