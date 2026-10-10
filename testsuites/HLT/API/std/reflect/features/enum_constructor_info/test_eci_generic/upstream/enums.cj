/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

import std.core.*

@Annotation
public class Tag { public const init() {} }

public class HelperC {
    public var w: Int64 = 0
    public init() {}
    public init(x: Int64) { this.w = x }
}

public enum EciGen<T>  {
| G1
| G2(T)
}

