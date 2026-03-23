/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import interoplib.objc.*
import objc.lang.*

@ObjCMirror
public open class C1 {
    @ForeignName["init"]
    public init()
}

@ObjCImpl
public class C2 <: C1 {
    @ForeignName["C2PlusInt64:"]
    public operator func + (xx: Int64): Int64 { 100 }
}

public interface I {
    operator func + (i: I): I { i }
}

public struct S {
    public operator func + (s: S): S { s }
}

public class C {
    public operator func + (c: C): C { c }
}

public enum E {
    X | Y
    public operator func + (e: E): E { e }
}
