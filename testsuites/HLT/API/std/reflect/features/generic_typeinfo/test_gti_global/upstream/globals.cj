/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

import std.core.*
import std.collection.*
import std.reflect.*

@Annotation
public class Tag { public const init() {} }

@Annotation
public class MyAnnotation {
    public let data: String
    public const init(data: String) { this.data = data }
}

public class GtiGenHolder {
    public func gtiGenInst<T>(v: T): T { v }
}

public class GtiGenStatic {
    public static func gtiGenPair<K, V>(k: K, v: V): V { v }
}

public func id<T>(v: T): T  {
v
}

public func pick<T>(a: T, b: T): T  where T <: Iface{
a
}

public func zip<A, B>(a: A, b: B): A  {
a
}

public interface Iface {}

public func findGfunc(name: String): GlobalFunctionInfo {
    let arr = PackageInfo.get("upstream").functions.toArray()
    for (f in arr) {
        if (f.name == name) {
            return f
        }
    }
    throw Exception("not found: " + name)
}

public func findGmethod(name: String): InstanceFunctionInfo {
    let holder = ClassTypeInfo.of(GtiGenHolder())
    let arr = holder.instanceFunctions.toArray()
    for (f in arr) {
        if (f.name == name) {
            return f
        }
    }
    throw Exception("not found: " + name)
}

public func findGsmethod(name: String): StaticFunctionInfo {
    let owner = ClassTypeInfo.of(GtiGenStatic())
    let arr = owner.staticFunctions.toArray()
    for (f in arr) {
        if (f.name == name) {
            return f
        }
    }
    throw Exception("not found: " + name)
}

public func gtiSigArray(name: String): Array<TypeInfo> {
    let gfi = findGfunc(name)
    let gtiArr = gfi.genericParams.toArray()
    let arr = ArrayList<TypeInfo>()
    for (g in gtiArr) { arr.add(g) }
    arr.toArray()
}

