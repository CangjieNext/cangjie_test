/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Test case for issue: Property named "x" is mirrored into method "getX()"
// which clashes with an existing member function "getX()".
// Expected behavior: Name clashes should be resolved by applying name mangling
// to the conflicting method.

package cj

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class NameClash <: JObject {
    public init() {}

    public prop x: Int32 { get() { 0 } }
    public func getX(): Bool { false }
}
