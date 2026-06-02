/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows and O2)EXEC: %compiler %cmp_opt %save_temps %f -o %output
// (not Windows and O2)EXEC: %disassembler %n.bc
// (not Windows and O2)EXEC: cat %n.ll | grep "llvm.cj.malloc.object(i8\* bitcast (%TypeInfo\* @\"std.core:Future<Int64>.ti\" to i8\*), i32 24)" 2>&1 | compare %f
// (not Windows and O2)RUN-EXEC-PIPE: %run %run_opt %output %run_args
// (not Windows and O2)ASSERT: scan std.core:Future

import std.sync.*

var num = AtomicInt64(0)

func testFuture(): Future<Unit> {
    return spawn {
        num.fetchAdd(1)
    }
}

main(): Int64 {
    var future = spawn {
        num.fetchAdd(1)
    }
    testFuture()
    sleep(1000000 * Duration.nanosecond)
    future.get()
    if (num.load() == 2) {
        return 0
    }
    return 0
}
