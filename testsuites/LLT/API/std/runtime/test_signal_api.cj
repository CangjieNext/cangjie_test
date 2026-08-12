/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.runtime.*
import std.unittest.*
import std.unittest.testmacro.*

@When[os != "Windows"]
@Test
public class SignalApiTest {
    let noopHandler: SignalHandlerFunc = { _: Int32 => false }

    @TestCase
    func testSignalConstants(): Unit {
        @Expect(Signal.SIGHUP.value, 0x1)
        @Expect(Signal.SIGINT.value, 0x2)
        @Expect(Signal.SIGQUIT.value, 0x3)
        @Expect(Signal.SIGTRAP.value, 0x5)
        @Expect(Signal.SIGALRM.value, 0xe)
        @Expect(Signal.SIGTERM.value, 0xf)
        let custom = Signal(0xa, "SIGUSR1")
        @Expect(custom.value, 0xa)
    }

    @TestCase
    func testRegisterInvalidSignal(): Unit {
        @AssertThrows[IllegalArgumentException](registerSignalHandler(Signal(0, "zero"), noopHandler))
        @AssertThrows[IllegalArgumentException](registerSignalHandler(Signal(32, "too-large"), noopHandler))
        @AssertThrows[IllegalArgumentException](registerSignalHandler(Signal(-1, "negative"), noopHandler))
    }

    @TestCase
    func testUnregisterInvalidSignal(): Unit {
        @AssertThrows[IllegalArgumentException](unregisterSignalHandler(Signal(0, "zero"), noopHandler))
        @AssertThrows[IllegalArgumentException](unregisterSignalHandler(Signal(32, "too-large"), noopHandler))
    }

    @TestCase
    func testResetInvalidSignalInArray(): Unit {
        @AssertThrows[IllegalArgumentException](resetSignalHandler([Signal(0, "zero")]))
        @AssertThrows[IllegalArgumentException](resetSignalHandler([Signal(32, "too-large")]))
    }

    @TestCase
    func testRegisterDuplicateHandler(): Unit {
        resetSignalHandler()
        let sig = Signal.SIGALRM
        let handler: SignalHandlerFunc = { _: Int32 => false }
        registerSignalHandler(sig, handler)
        registerSignalHandler(sig, handler)
        unregisterSignalHandler(sig, handler)
        resetSignalHandler([sig])
    }

    @TestCase
    func testRegisterUnregisterLifecycle(): Unit {
        resetSignalHandler()
        let sig = Signal.SIGALRM
        let handler: SignalHandlerFunc = { _: Int32 => false }
        registerSignalHandler(sig, handler)
        unregisterSignalHandler(sig, handler)
        unregisterSignalHandler(sig, handler)
        resetSignalHandler([sig])
    }

    @TestCase
    func testResetAllHandlers(): Unit {
        resetSignalHandler()
        registerSignalHandler(Signal.SIGALRM, noopHandler)
        resetSignalHandler(Array<Signal>())
        unregisterSignalHandler(Signal.SIGALRM, noopHandler)
    }
}
