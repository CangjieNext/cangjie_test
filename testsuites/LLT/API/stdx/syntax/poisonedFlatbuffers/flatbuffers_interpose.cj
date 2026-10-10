/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./copy_flatbuffers_with_exception
// Probes Cangjie package `flatbuffers` symbols exported by **libstdx.syntax.so**.
// parseText reads C++-produced SyntaxFormat via Table.offset. Do not import
// flatbuffers. If syntax still exports _CN11flatbuffers*, format getters are
// redirected to the poisoned Table.offset and throws. Hidden symbols keep
// syntax's own copy.
// --compile-target=staticlib: library package, no main.
// EXEC: %compiler %cmp_opt --no-sub-pkg -p ./copy_flatbuffers_with_exception --output-type=obj --compile-target=staticlib --experimental -o flatbuffers.%object_file_suffix
// EXEC: %compiler %import-cangjie-stdx %cmp_opt --experimental %f flatbuffers.%object_file_suffix -o %n.%suffix
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import stdx.syntax.parseText

main() {
    try {
        let parsed = parseText("func f() { 1 }")
        if (parsed.node.isNone()) {
            return 1
        }
        return 0
    } catch (e: Exception) {
        let msg = e.message
        if (msg.contains("poisoned flatbuffers")) {
            // libstdx.syntax.so used the copy from this executable: symbols were exported.
            return 2
        }
        throw e
    }
}
