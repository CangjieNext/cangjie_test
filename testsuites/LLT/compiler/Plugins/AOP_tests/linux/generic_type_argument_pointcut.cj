// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan exact=1\nwildcard=1\nprocessIntegers\nwildcard=1\nprocessStrings\nexactHits=1\nwildcardHits=2\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

var exactHits: Int64 = 0
var wildcardHits: Int64 = 0

@InsertAtEntry[
    packageName: "default",
    className: "",
    methodName: "process*",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(Array<Int64>)->Unit"
]
public func exactArrayElement(args: Array<Any>): Unit {
    exactHits++
    println("exact=${args.size}")
}

@InsertAtEntry[
    packageName: "default",
    className: "",
    methodName: "process*",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(std.core.Array<*>)->Unit"
]
public func wildcardArrayElement(args: Array<Any>): Unit {
    wildcardHits++
    println("wildcard=${args.size}")
}

public func processIntegers(values: Array<Int64>): Unit {
    println("processIntegers")
}

public func processStrings(values: Array<String>): Unit {
    println("processStrings")
}

main() {
    processIntegers([1, 2])
    processStrings(["a"])
    println("exactHits=${exactHits}")
    println("wildcardHits=${wildcardHits}")
    0
}
