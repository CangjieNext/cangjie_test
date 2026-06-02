/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Unix) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt

import std.net.*
import std.time.*

@When[os == "macOS"]
const expectReuseAddrOptionValue: Byte = 4
@When[os == "Linux"]
const expectReuseAddrOptionValue: Byte = 1

@Test
class Test_Set_and_Get {
    @TestCase
    func OptionValueInt(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        // set Option value
        let setVal: Array<Byte> = [1, 0, 0, 0]
        let setHd = unsafe { acquireArrayRawData(setVal) }
        unsafe { server.setSocketOption(OptionLevel.SOCKET, OptionName.SO_REUSEADDR, setHd.pointer, Int32(setVal.size)) }
        unsafe { releaseArrayRawData(setHd) }
        // get Option value
        let gotVal: Array<Byte> = [0, 0, 0, 0]
        let gotHd = unsafe { acquireArrayRawData(gotVal) }
        var size: CPointer<Int32> = LibC.malloc<Int32>(count: 1)
        unsafe { size.write(10) } // the value of size must bigger than or equal to the optVal byte size
        unsafe { server.getSocketOption(OptionLevel.SOCKET, OptionName.SO_REUSEADDR, gotHd.pointer, size) }
        unsafe { releaseArrayRawData(gotHd) }
        let val = unsafe { size.read() }
        unsafe { LibC.free(size) }
        // expect
        setVal[0] = expectReuseAddrOptionValue
        @Expect(gotVal, setVal)
        @Expect(val, 4)
        server.close()
    }

    @TestCase
    func OptionValueLinger(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        // set Option value
        let setLinger: Array<Byte> = [1, 0, 0, 0, 1, 0, 0, 0]
        let setHd = unsafe { acquireArrayRawData(setLinger) }
        unsafe { server.setSocketOption(OptionLevel.SOCKET, OptionName.SO_LINGER, setHd.pointer, Int32(setLinger.size)) }
        unsafe { releaseArrayRawData(setHd) }
        // get Option value
        let gotLinger: Array<Byte> = [0, 0, 0, 0, 0, 0, 0, 0]
        let gotHd = unsafe { acquireArrayRawData(gotLinger) }
        var size: CPointer<Int32> = LibC.malloc<Int32>(count: 1)
        unsafe { size.write(10) } // the value of size must bigger than or equal to the optVal byte size
        unsafe { server.getSocketOption(OptionLevel.SOCKET, OptionName.SO_LINGER, gotHd.pointer, size) }
        unsafe { releaseArrayRawData(gotHd) }
        let val = unsafe { size.read() }
        unsafe { LibC.free(size) }
        // expect
        @Expect(gotLinger, setLinger)
        @Expect(val, 8)
        server.close()
    }
}
