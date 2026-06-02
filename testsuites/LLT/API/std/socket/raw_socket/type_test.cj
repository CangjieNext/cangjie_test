/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt

import std.net.*

let SOCKET_STREAM: Int32 = 1
let SOCKET_DGRAM: Int32 = 2
let SOCKET_RAW: Int32 = 3
let SOCKET_SEQPACKET: Int32 = 5

@Test
class TestType {
    let stream = SocketType(SOCKET_STREAM)
    let dGram = SocketType(SOCKET_DGRAM)
    let raw = SocketType(SOCKET_RAW)
    let seqPacket = SocketType(SOCKET_SEQPACKET)

    @TestCase
    func test_init(): Unit {
        @Expect(stream, SocketType.STREAM)
        @Expect(dGram, SocketType.DATAGRAM)
        @Expect(raw, SocketType.RAW)
        @Expect(seqPacket, SocketType.SEQPACKET)
    }

    @TestCase
    func test_toString(): Unit {
        @Expect(SocketType.STREAM.toString(), "STREAM")
        @Expect(SocketType.DATAGRAM.toString(), "DATAGRAM")
        @Expect(SocketType.RAW.toString(), "RAW")
        @Expect(SocketType.SEQPACKET.toString(), "SEQPACKET")
        @Expect(SocketType(100).toString(), "Type(100)")
    }

    @TestCase
    func test_hashCode(): Unit {
        @Expect(stream.hashCode(), SocketType.STREAM.hashCode())
        @Expect(dGram.hashCode(), SocketType.DATAGRAM.hashCode())
        @Expect(raw.hashCode(), SocketType.RAW.hashCode())
        @Expect(seqPacket.hashCode(), SocketType.SEQPACKET.hashCode())
        @Expect(SocketType(100).hashCode(), SocketType(100).hashCode())
    }
}
