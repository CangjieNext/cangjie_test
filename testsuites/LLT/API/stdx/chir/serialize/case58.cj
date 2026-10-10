/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Compiler-emitted CHIR deserialized then serializePackage: covers IntrinsicKind /
// FuncKind / SourceExpr / chirAnno arms that public IR builders cannot construct.

/* SCAN
chir emit ok: true
chir bytes positive: true
deser functions positive: true
serialize size positive: true
round trip equal: true
*/

import std.fs.*
import stdx.chir.*

foreign func system(command: CString): Int32

main() {
    let srcPath = "ser58_src.cj"
    let chirPath = "ser58_pkg.chir"
    let source = """
open class Base {
    public var x: Int64 = 1
    public open func id(): Int64 { this.x }
    public init() {}
}
class Derived <: Base {
    public init() { super() }
    public func id(): Int64 { super.id() + 1 }
    public mut prop p: Int64 {
        get() { this.x }
        set(v) { this.x = v }
    }
}
enum Color { | Red | Green(Int64) }
struct Point {
    public var x: Int64
    public var y: Int64
    public init(x: Int64, y: Int64) {
        this.x = x
        this.y = y
    }
}
func withDefault(a: Int64, b!: Int64 = 2): Int64 { a + b }
main() {
    var arr = [1, 2, 3]
    let idx: Int64 = 1
    arr[0] = arr[idx]
    var sum = 0
    for (e in arr) { sum += e }
    for (i in 0..2) { sum += i }
    var i = 0
    while (i < 1) { i += 1 }
    do { i -= 1 } while (i > 0)
    if (sum > 0) { sum += 1 } else { sum -= 1 }
    let c = Color.Green(3)
    match (c) {
        case Red => ()
        case Green(v) => sum += v
    }
    let opt: ?Int64 = 1
    if (let Some(v) <- opt) { sum += v }
    let q = opt ?? 0
    let d = Derived()
    d.p = 3
    let n = withDefault(1)
    let pt = Point(1, 2)
    try { throw Exception("e") } catch (e: Exception) { sum += 1 }
    let a = 1 + 2
    let s = a << 1
    println(sum + d.id() + q + n + pt.x + s)
    0
}
"""
    let srcFile = File(srcPath, Write)
    srcFile.write(source.toArray())
    srcFile.close()

    let emitCmd = "cjc --emit-chir=raw -o ${chirPath} ${srcPath}"
    let emitRet = unsafe { system(LibC.mallocCString(emitCmd)) }
    println("chir emit ok: ${emitRet == 0}")

    let bytes = File.readFrom(chirPath)
    println("chir bytes positive: ${bytes.size > 0}")

    let pkg = unsafe {
        let raw = acquireArrayRawData(bytes)
        let p = deserializePackage(CPointer<UInt8>(raw.pointer), bytes.size)
        releaseArrayRawData(raw)
        p
    }
    let n0 = pkg.functions.size
    println("deser functions positive: ${n0 > 0}")

    let (data, size) = serializePackage(pkg)
    println("serialize size positive: ${size > 0}")
    let pkg2 = deserializePackage(data, size)
    unsafe { freeSerializedMemory() }
    println("round trip equal: ${pkg2.functions.size == n0 && pkg2.name == pkg.name}")
}
