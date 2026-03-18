/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package issue

import interoplib.interop.*

// Test case for issue: Name clashes between property getters and methods
// All three members generate methods named "getX()" causing Java compilation errors

public class NameClash {
    public prop x: Int { get() { 0 } }
    public func getX(): Bool { false }
    public static prop X: Float64 { get() { 0.0 } }
}
