// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test case for issue: Name clash between property getter and existing method
// Property "x" generates "getX()" which conflicts with existing method "getX()"
// Expected behavior: Compiler should detect and report name clash

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %enable_java_cjmapping %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f

package issue

import interoplib.interop.*

public class NameClash {
    public prop x: Int { get() { 0 } }
    public func getX(): Bool { false }
}

/* SCAN-IN
error: name clash detected: property 'x' generates method 'getX()' which conflicts with existing method 'getX()'
*/
