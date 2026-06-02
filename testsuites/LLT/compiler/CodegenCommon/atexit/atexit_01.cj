// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello WorldHello WorldHello CJC

internal import std.process.*

main() {
    var call = callBack()
    Process.current.atExit(call.callback1)
    Process.current.atExit(call.callback2)
    Process.current.atExit(call.callback2)
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
