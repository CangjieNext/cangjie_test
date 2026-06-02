// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello WorldHello CJC
// ASSERT: scan-not user.main() end

internal import std.process.*

func createThread() {
    var call = callBack()
    Process.current.atExit(call.callback2)
    Process.current.exit(1)
}

main() {
    var call = callBack()
    Process.current.atExit(call.callback1)

    let fut1: Future<Unit> = spawn {createThread()}
    fut1.get()

    println("user.main() end")
    return 0
}

class callBack {
    func callback1(): Unit {
        print("Hello CJC")
    }

    func callback2(): Unit {
        print("Hello World")
    }
}
