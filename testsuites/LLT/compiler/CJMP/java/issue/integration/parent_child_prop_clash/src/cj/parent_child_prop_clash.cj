/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Test case for issue: Mutable property "x" generates both getter "getX()" and setter "setX()",
// and the setter clashes with an existing member function "setX()".
// Expected behavior: Name clashes should be resolved by applying name mangling
// to the conflicting method. The generated Java code should compile without errors.

package cj

import java.lang.*

@JavaImpl
public class ParentChildPropClash <: JObject {
    public init() {}

    public mut prop x: Int32 {
        get() { 0 }
        set(value) {}
    }
    
    public func setX(value: Bool): Unit {}
}
