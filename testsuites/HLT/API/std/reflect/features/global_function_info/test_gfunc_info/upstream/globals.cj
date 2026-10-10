/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

import std.core.*

import std.reflect.*

@Annotation
public class Tag { public const init() {} }

@Annotation
public class MyAnnotation {
    public let data: String
    public const init(data: String) { this.data = data }
}
public interface Iface {}

public func zeroParam(): Int64  {
42
}

public func add(a: Int64, b: Int64): Int64  {
a + b
}

public func negate(x: Int64): Int64  {
-x
}

public func format(value: Int64, radix!: Int64): String  {
"fmt"
}

public func sum(ns: Array<Int64>): Int64  {
var t: Int64 = 0; for (n in ns) { t += n }; t
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

public func doNothing(): Unit  {
return ()
}

public func getPi(): Float64  {
3.14159
}

public func isEven(n: Int64): Bool  {
n % 2 == 0
}

public func greeting(): String  {
"hello"
}

public func apply(f: (Int64) -> Int64): Int64  {
f(1)
}

public func wrapper(a: Int64, b: Int64): Int64  {
add(a, b)
}

public func fact(n: Int64): Int64  {
if (n <= 1) { 1 } else { fact(n - 1) * n }
}

public func findGfunc(name: String): GlobalFunctionInfo {
    let arr = PackageInfo.get("upstream").functions.toArray()
    for (f in arr) {
        if (f.name == name) {
            return f
        }
    }
    throw Exception("not found: " + name)
}

