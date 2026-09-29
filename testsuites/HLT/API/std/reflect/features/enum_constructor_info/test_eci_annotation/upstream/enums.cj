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
public class Dup { public const init() {} }

@Annotation
public class CTag <: Equatable<CTag> & ToString {
    public const CTag(public let d: String) {}
    public operator func ==(another: CTag): Bool { this.d == another.d }
    public operator func !=(another: CTag): Bool { !(this == another) }
    public func toString(): String { "CTag" }
}

@Annotation
public class Tag { public const init() {} }

public class HelperC {
    public var w: Int64 = 0
    public init() {}
    public init(x: Int64) { this.w = x }
}

public enum EciAnn  {
| C1
| @Tag C2(Int64)
| @Dup @Dup C3
| @CTag["hello"] C4(String)
}

@Tag
public enum EciAnnT  {
| T1
}

