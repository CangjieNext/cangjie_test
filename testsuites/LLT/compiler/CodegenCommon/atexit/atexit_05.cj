// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello CJCHello CJCHello CJCHello CJCHello CJCHello CJCHello CJCHello CJCHello CJCHello CJC

internal import std.process.*

func createThread() {
    var call = callBack()
    var count: Int32 = 5
    while (count > 0) {
        Process.current.atExit(call.callback1)
        count -= 1
    }
}

main() {
    let fut1: Future<Unit> = spawn {createThread()}
    let fut2: Future<Unit> = spawn {createThread()}
    fut1.get()
    fut2.get()
    return 0
}

class callBack {
    func callback1(): Unit {
        print("Hello CJC")
    }
}
