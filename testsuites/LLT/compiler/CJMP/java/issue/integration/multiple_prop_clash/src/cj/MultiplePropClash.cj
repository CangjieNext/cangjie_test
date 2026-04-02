/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Test case for issue: Multiple properties with names that only differ in case
// (e.g., "x" and "X") both generate the same getter method name "getX()" in Java.
// Expected behavior: Name clashes should be resolved by applying name mangling
// to the conflicting methods.

package cj

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class MultiplePropClash <: JObject {
    public init() {}

    public prop x: Int32 { get() { 0 } }
    public func getX(): Bool { false }
    public static prop X: Float64 { get() { 1.0 } }
}
