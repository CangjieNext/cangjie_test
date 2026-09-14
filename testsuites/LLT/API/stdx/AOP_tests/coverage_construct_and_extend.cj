/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Covers remaining stdx.aspect_cj.aspect_cj.cj paths in one compile-and-run:
// - runtime construction of InsertAtEntry / InsertAtExit / ReplaceFuncBody (init coverage)
// - getFuncOuterTypeName else branch via weaving into `extend Int64`
// - mapArrayTo on an empty parameter list via ReplaceFuncBody with only `original`

// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %weave_aspects_plugin
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan #----- InsertAtEntry constructed -----#\n#----- InsertAtExit constructed -----#\n#----- ReplaceFuncBody constructed -----#\n#----- aspect -----#\n#----- foo -----#\n#----- wrap -----#\n#----- original -----#\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

@InsertAtEntry[packageName: "default", className: "Int64", methodName: "aopFoo", isStatic: false,
    recursive: false, funcTypeStr: "()->Unit"]
public func aspect(): Unit {
    println("#----- aspect -----#")
}

@ReplaceFuncBody[packageName: "default", className: "", methodName: "woven", isStatic: false,
    recursive: false]
public func wrap(original: () -> Unit): Unit {
    println("#----- wrap -----#")
    original()
}

extend Int64 {
    public func aopFoo(): Unit {
        println("#----- foo -----#")
    }
}

public func woven(): Unit {
    println("#----- original -----#")
}

main() {
    let entry = InsertAtEntry(
        packageName: "default",
        className: "Int64",
        methodName: "aopFoo",
        isStatic: false,
        recursive: false,
        funcTypeStr: "()->Unit")
    let exitAnno = InsertAtExit(
        packageName: "default",
        className: "",
        methodName: "woven",
        isStatic: false,
        recursive: false,
        funcTypeStr: "()->Unit")
    let replace = ReplaceFuncBody(
        packageName: "default",
        className: "",
        methodName: "woven",
        isStatic: false,
        recursive: false)
    if (entry is InsertAtEntry) {
        println("#----- InsertAtEntry constructed -----#")
    }
    if (exitAnno is InsertAtExit) {
        println("#----- InsertAtExit constructed -----#")
    }
    if (replace is ReplaceFuncBody) {
        println("#----- ReplaceFuncBody constructed -----#")
    }
    1.aopFoo()
    woven()
    0
}
