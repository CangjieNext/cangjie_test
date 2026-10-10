// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan integers:exact=1,wildcard=1\nstrings:exact=1,wildcard=2\nfunctions:exact=1,wildcard=1\nother:exact=1,wildcard=1\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

var nestedExact: Int64 = 0
var nestedWildcard: Int64 = 0
var functionExact: Int64 = 0
var functionWildcard: Int64 = 0

@InsertAtEntry[
    packageName: "default", className: "", methodName: "nested*",
    isStatic: false, recursive: false, funcTypeStr: "(Array<Array<Int64>>)->Unit"
]
public func exactNested(args: Array<Any>): Unit { nestedExact++ }

@InsertAtEntry[
    packageName: "default", className: "", methodName: "nested*",
    isStatic: false, recursive: false, funcTypeStr: "(Array<Array<*>>)->Unit"
]
public func wildcardNested(args: Array<Any>): Unit { nestedWildcard++ }

@InsertAtEntry[
    packageName: "default", className: "", methodName: "function*",
    isStatic: false, recursive: false, funcTypeStr: "(Array<(Int64)->Bool>)->Unit"
]
public func exactFunction(args: Array<Any>): Unit { functionExact++ }

@InsertAtEntry[
    packageName: "default", className: "", methodName: "function*",
    isStatic: false, recursive: false, funcTypeStr: "(Array<(*)->Bool>)->Unit"
]
public func wildcardFunction(args: Array<Any>): Unit { functionWildcard++ }

public func nestedIntegers(values: Array<Array<Int64>>): Unit {
    println("integers:exact=${nestedExact},wildcard=${nestedWildcard}")
}
public func nestedStrings(values: Array<Array<String>>): Unit {
    println("strings:exact=${nestedExact},wildcard=${nestedWildcard}")
}
public func functionBooleans(values: Array<(Int64)->Bool>): Unit {
    println("functions:exact=${functionExact},wildcard=${functionWildcard}")
}
public func functionStrings(values: Array<(Int64)->String>): Unit {
    println("other:exact=${functionExact},wildcard=${functionWildcard}")
}

main() {
    nestedIntegers([[1, 2]])
    nestedStrings([["cj"]])
    functionBooleans([{id: Int64 => id > 0}])
    functionStrings([{id: Int64 => id.toString()}])
    0
}
