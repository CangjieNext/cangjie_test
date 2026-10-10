// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt cross_package_pointcut_args_array_advice.cj --output-type=staticlib -o libcross_advice.a %collect_aspects_plugin
// (CJNATIVE and Linux)EXEC-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt cross_target.cj libcross_advice.a -o %output %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan before=2\nbefore-id=1\nbefore-name=cj\nhandle=1:cj\nafter=2\nafter-id=1\nafter-name=cj\nbefore=0\nempty\nafter=0\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// SEPARATE-FILE: cross_target.cj
package cross_target

// This package intentionally never refers to Array, Any, or stdx.aspect_cj.
public func handle(id: Int64, name: String): Unit {
    println("handle=${id}:${name}")
}

public func handleEmpty(): Unit {
    println("empty")
}

main() {
    handle(1, "cj")
    handleEmpty()
    0
}

// SEPARATE-FILE: cross_package_pointcut_args_array_advice.cj
package cross_advice

import stdx.aspect_cj.*

@InsertAtEntry[
    packageName: "cross_target",
    className: "",
    methodName: "handle*",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(**)->Unit"
]
public func beforeHandle(args: Array<Any>): Unit {
    printArgs("before", args)
    if (args.size == 2) {
        // Updating the advice's array must not write back to target parameters.
        args[0] = 99
    }
}

@InsertAtExit[
    packageName: "cross_target",
    className: "",
    methodName: "handle*",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(**)->Unit"
]
public func afterHandle(args: Array<Any>): Unit {
    printArgs("after", args)
}

private func printArgs(label: String, args: Array<Any>): Unit {
    println("${label}=${args.size}")
    if (args.size == 2) {
        match (args[0]) {
            case id: Int64 => println("${label}-id=${id}")
            case _ => throw IllegalArgumentException("wrong cross-package argument type")
        }
        match (args[1]) {
            case name: String => println("${label}-name=${name}")
            case _ => throw IllegalArgumentException("wrong cross-package argument type")
        }
    } else if (args.size != 0) {
        throw IllegalArgumentException("wrong cross-package argument count")
    }
}
