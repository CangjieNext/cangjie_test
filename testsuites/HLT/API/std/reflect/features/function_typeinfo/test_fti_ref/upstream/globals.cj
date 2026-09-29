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

@Annotation
public class MyAnnotation {
    public let data: String
    public const init(data: String) { this.data = data }
}

public func ftiGlobalAdd(a: Int64, b: Int64): Int64 { a + b }

public class FtiHolder {
    public let factor: Int64
    public init(factor: Int64) { this.factor = factor }
    public func addFactor(x: Int64): Int64 { x + this.factor }
}

public class FtiStatic {
    public static func doubleIt(x: Int64): Int64 { x * 2 }
}

public class GtiGenHolder {
    public func gtiGenInst<T>(v: T): T { v }
}

public class GtiGenStatic {
    public static func gtiGenPair<K, V>(k: K, v: V): V { v }
}

