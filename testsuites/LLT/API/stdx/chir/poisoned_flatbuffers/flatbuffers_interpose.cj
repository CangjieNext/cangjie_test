/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./copy_flatbuffers_with_exception
// Probes Cangjie package `flatbuffers` symbols exported by **libstdx.chir.so**.
// serializePackage uses a package-level Builder and calls startObject; parseDecl
// (std.ast) and parseText (stdx.syntax) do not take that write path, so they
// cannot observe this poison. Same-process mix of the three libs is covered by
// mix_std_ast_stdx.cj.
// Compile the in-tree copy (startObject throws) to an object file and link it
// into this executable. Do not import flatbuffers. If chir still exports
// _CN11flatbuffers*, serializePackage is redirected to the poisoned copy and
// throws. Hidden symbols keep chir's own copy.
// --compile-target=staticlib: library package, no main.
// EXEC: %compiler %cmp_opt --no-sub-pkg -p ./copy_flatbuffers_with_exception --output-type=obj --compile-target=staticlib --experimental -o flatbuffers.%object_file_suffix
// EXEC: %compiler %import-cangjie-stdx %cmp_opt --experimental %f flatbuffers.%object_file_suffix -o %n.%suffix
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import std.collection.*
import stdx.chir.*

main() {
    try {
        let pkg = Package("pkg.mix", AccessLevel.Public)
        let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "f", "f", "pkg.mix")
        fn.initBody()
        let bg = fn.body.getOrThrow()
        bg.entryBlock.appendExpr(Exit.create())
        let (data, size) = serializePackage(pkg)
        let pkg2 = deserializePackage(data, size)
        if (pkg.toString() != pkg2.toString()) {
            return 1
        }
        return 0
    } catch (e: Exception) {
        let msg = e.message
        if (msg.contains("poisoned flatbuffers")) {
            // libstdx.chir.so used the copy from this executable: symbols were exported.
            return 2
        }
        throw e
    }
}
