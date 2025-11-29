/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows) EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// (not Windows) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.runtime.*

let signals = [
    Signal.SIGHUP, // 0x1
    Signal.SIGINT, // 0x2
    Signal.SIGQUIT, // 0x3
    // Signal.SIGILL, // not support now
    Signal.SIGTRAP, // 0x5
    // Signal.SIGABRT,
    // Signal.SIGBUS,
    // Signal.SIGFPE,
    // Signal.SIGKILL,
    // Signal.SIGSEGV,
    // Signal.SIGPIPE,
    Signal.SIGALRM, // 0xe
    Signal.SIGTERM // 0xf
]
let sig_nums: Array<Int32> = [
    1,
    2,
    3,
    5,
    10,
    12,
    14,
    15,
    16,
    17,
    18,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
    // 4, 6, 7, 8, 9, 11, 13, 19 // not support now
]

@Test
class Test_Signal_Class {
    @TestCase
    func test_sig_01(): Unit {
        @Assert(signals.map{i => i.value}, [1i32, 2i32, 3i32, 5i32, 14i32, 15i32])
    }

    @TestCase
    func test_sig_02(): Unit {
        for (sig in sig_nums) {
            let signal = Signal(sig, "newsig: ${sig}")
            @Assert(signal.value, sig)
        }
    }

    @TestCase
    func test_sig_03(): Unit {
        let sig_illegals = [-1i32, 0i32, 12512341i32]
        for (sig in sig_nums) {
            let signal = Signal(sig, "newsig: 信号${sig}\0")
            @Assert(signal.value, sig)
        }
    }
}
