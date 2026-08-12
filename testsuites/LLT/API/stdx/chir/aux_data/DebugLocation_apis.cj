/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
invalid loc str empty: true
invalid start pos str: -0-0
chir emit ok: true
chir bytes positive: true
deser member loc valid: true
start pos str prefix dash: true
loc toString: loc: "debug_location_source.cj"-4-5, scope: 0
member str has loc comment: true
*/

import std.fs.*
import stdx.chir.*

foreign func system(command: CString): Int32

main() {
    let invalidLoc = CustomAnnoInstance("Anno").location
    println("invalid loc str empty: ${invalidLoc.toString().isEmpty()}")
    println("invalid start pos str: ${invalidLoc.start.toString()}")

    let srcPath = "debug_location_source.cj"
    let chirPath = "debug_location_pkg.chir"
    let source = """
package debug_location_src

class S {
    var a: Int64 = 1
}

main() {
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

    let cls = pkg.classDefs[0]
    let member = cls.instanceVars[0]
    let loc = member.location
    let startPos = loc.start

    println("deser member loc valid: ${loc.isValid()}")
    println("start pos str prefix dash: ${startPos.toString().startsWith("-")}")
    println("loc toString: ${loc.toString()}")
    println("member str has loc comment: ${member.toString().contains("loc:")}")
}
