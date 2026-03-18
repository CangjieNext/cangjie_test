// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test case for issue: Constructor is mirrored even when not listed in symbols
// When generic_object_configuration has type_arguments but no corresponding
// symbols entry for the instantiated type, no members should be mirrored

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %enable_java_cjmapping %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f

package generic

import interoplib.interop.*

public struct G<T> {
    public func f(t: T): T { t }
}

public struct H<T> {
    public func g(t: T): T { t }
}

// ASSERT: scan-not error
