// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan processIntegers:exact=1,wildcard=1,typed=1\nprocessStrings:exact=1,wildcard=2,typed=1\nexactHits=1\nwildcardHits=2\ntypedHits=1\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

var exactHits: Int64 = 0
var wildcardHits: Int64 = 0
var typedHits: Int64 = 0

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
    if (args.size != 1) {
        throw IllegalArgumentException("wrong exact argument count")
    }
    match (args[0]) {
        case values: Array<Int64> =>
            if (values.size != 2 || values[0] != 1 || values[1] != 2) {
                throw IllegalArgumentException("wrong exact array values")
            }
        case _ => throw IllegalArgumentException("wrong exact array type")
    }
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
    if (args.size != 1) {
        throw IllegalArgumentException("wrong wildcard argument count")
    }
}

@InsertAtEntry[
    packageName: "default",
    className: "",
    methodName: "processIntegers",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(Array<Int64>)->Unit"
]
public func typedArrayElement(values: Array<Int64>): Unit {
    typedHits++
    if (values.size != 2 || values[0] != 1 || values[1] != 2) {
        throw IllegalArgumentException("wrong typed array values")
    }
}

public func processIntegers(values: Array<Int64>): Unit {
    // All entry advices must run before the body; their relative order is not
    // part of the pointcut matching contract.
    println("processIntegers:exact=${exactHits},wildcard=${wildcardHits},typed=${typedHits}")
}

public func processStrings(values: Array<String>): Unit {
    println("processStrings:exact=${exactHits},wildcard=${wildcardHits},typed=${typedHits}")
}

main() {
    processIntegers([1, 2])
    processStrings(["a"])
    println("exactHits=${exactHits}")
    println("wildcardHits=${wildcardHits}")
    println("typedHits=${typedHits}")
    0
}
