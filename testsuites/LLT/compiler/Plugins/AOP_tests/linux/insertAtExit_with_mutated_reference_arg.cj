// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan target.before=entry\ntarget.after=changed\nexit.value=changed\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.aspect_cj.*

public class MutableArg {
    public var value: String

    public init(value: String) {
        this.value = value
    }
}

@InsertAtExit[
    packageName: "default",
    className: "",
    methodName: "mutateReferenceArg",
    isStatic: false,
    recursive: false,
    funcTypeStr: "(default.MutableArg)->std.core.Unit"
]
public func readMutatedReferenceAtExit(args: Array<Any>): Unit {
    match (args[0]) {
        case value: MutableArg => println("exit.value=${value.value}")
        case _ => println("exit.value=<unexpected>")
    }
}

public func mutateReferenceArg(arg: MutableArg): Unit {
    println("target.before=${arg.value}")
    arg.value = "changed"
    println("target.after=${arg.value}")
}

main() {
    mutateReferenceArg(MutableArg("entry"))
    0
}
