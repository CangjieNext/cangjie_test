/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Using annotations as `@InsertAtEntry[...]` does not execute the annotation class
// constructors at runtime. Construct the three public annotation types explicitly
// so their `init` bodies are covered.

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan #----- InsertAtEntry constructed -----#\n#----- InsertAtExit constructed -----#\n#----- ReplaceFuncBody constructed -----#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

main() {
    let entryFalse = InsertAtEntry(
        packageName: "default",
        className: "",
        methodName: "foo",
        isStatic: false,
        recursive: false,
        funcTypeStr: "()->Unit")
    let entryTrue = InsertAtEntry(
        packageName: "std.core",
        className: "Int64",
        methodName: "bar",
        isStatic: true,
        recursive: true,
        funcTypeStr: "(Int64)->Unit")
    if (entryFalse is InsertAtEntry && entryTrue is InsertAtEntry) {
        println("#----- InsertAtEntry constructed -----#")
    }

    let exitFalse = InsertAtExit(
        packageName: "default",
        className: "",
        methodName: "foo",
        isStatic: false,
        recursive: false,
        funcTypeStr: "()->std.core.String")
    let exitTrue = InsertAtExit(
        packageName: "pkg",
        className: "Cls",
        methodName: "baz",
        isStatic: true,
        recursive: true,
        funcTypeStr: "(std.core.String)->Unit")
    if (exitFalse is InsertAtExit && exitTrue is InsertAtExit) {
        println("#----- InsertAtExit constructed -----#")
    }

    let replaceFalse = ReplaceFuncBody(
        packageName: "default",
        className: "",
        methodName: "foo",
        isStatic: false,
        recursive: false)
    let replaceTrue = ReplaceFuncBody(
        packageName: "pkg",
        className: "Cls",
        methodName: "baz",
        isStatic: true,
        recursive: true)
    if (replaceFalse is ReplaceFuncBody && replaceTrue is ReplaceFuncBody) {
        println("#----- ReplaceFuncBody constructed -----#")
    }
    0
}
