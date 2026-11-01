/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// isMut / isInitializer / isAnnoFactoryFunc / Primary*Constructor 无 public setter，
// 只能来自编译器产出的 CHIR；参照 DebugLocation_apis.cj 用 --emit-chir=raw 覆盖 true 分支。
// macOS 强制 disableReflection，不会生成 AnnoFactoryFunc，故该平台按「未产出」视为符合预期。

/* SCAN
chir emit ok: true
chir bytes positive: true
compiler mut: true
compiler initializer: true
compiler anno factory: true
compiler primary class ctor: true
compiler primary struct ctor: true
*/

import std.fs.*
import stdx.chir.*

foreign func system(command: CString): Int32

// macOS forces disableReflection, so AnnoFactoryFunc is never emitted into CHIR.
@When[os == "macOS"]
func expectAnnoFactoryEmitted(): Bool {
    false
}

@When[os != "macOS"]
func expectAnnoFactoryEmitted(): Bool {
    true
}

main() {
    let srcPath = "attrs_kinds_source.cj"
    let chirPath = "attrs_kinds_pkg.chir"
    let source = """
package attrs_kinds_src

@Annotation
public class MyAnno {
    public let msg: String
    public const init(msg: String) { this.msg = msg }
}

public class C {
    public var x: Int64
    public C(x: Int64) {
        this.x = x
    }
}

public struct S {
    public var y: Int64
    public S(y: Int64) {
        this.y = y
    }
    public mut func bump() {
        this.y += 1
    }
}

@MyAnno["hi"]
public func tagged(): Int64 { 1 }

main() {
    let c = C(1)
    var s = S(2)
    s.bump()
    tagged()
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

    var foundMut = false
    var foundInitializer = false
    var foundAnnoFactory = false
    var foundPrimaryClassCtor = false
    var foundPrimaryStructCtor = false
    for (fn in pkg.functions) {
        if (fn.packageName != "attrs_kinds_src") {
            continue
        }
        if (fn.isMut()) {
            foundMut = true
        }
        if (fn.isInitializer()) {
            foundInitializer = true
        }
        if (fn.isAnnoFactoryFunc()) {
            foundAnnoFactory = true
        }
    }
    for (cd in pkg.classDefs) {
        if (cd.srcCodeName != "C") {
            continue
        }
        for (m in cd.methods) {
            // Primary class ctor: isClassConstructor covers PrimaryClassConstructor branch
            if (m.srcCodeName == "init" && m.isClassConstructor()) {
                foundPrimaryClassCtor = true
            }
        }
    }
    for (sd in pkg.structDefs) {
        if (sd.srcCodeName != "S") {
            continue
        }
        for (m in sd.methods) {
            // Primary struct ctor: isStructConstructor covers PrimaryStructConstructor branch
            if (m.srcCodeName == "init" && m.isStructConstructor()) {
                foundPrimaryStructCtor = true
            }
        }
    }
    println("compiler mut: ${foundMut}")
    println("compiler initializer: ${foundInitializer}")
    println("compiler anno factory: ${foundAnnoFactory == expectAnnoFactoryEmitted()}")
    println("compiler primary class ctor: ${foundPrimaryClassCtor}")
    println("compiler primary struct ctor: ${foundPrimaryStructCtor}")
}
