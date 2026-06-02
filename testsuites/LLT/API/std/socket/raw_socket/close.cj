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
import std.time.*
import std.sync.*

@Test
class TestClose {
    @TestCase
    func bind_after_close(): Unit {
        let rs = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        rs.close()
        let array: Array<Byte> = [2, 0, 39, 40, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        try {
            rs.bind(s_addr)
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
    }

    @TestCase
    func listen_after_close(): Unit {
        let rs = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        rs.close()
        try {
            rs.listen(0)
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
    }

    @TestCase
    func accept_after_close(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 46, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(30)
        server.close()
        try {
            server.accept()
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
    }

    @TestCase
    func connect_after_close(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 41, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)
        client.close()
        try {
            client.connect(s_addr)
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
        server.close()
    }

    @TestCase
    func send_after_close(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 42, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)
        spawn {
            client.connect(s_addr)
        }
        server.accept()
        sleep(Duration.second) // wait for connnect
        try {
            let msg_send: Array<Byte> = "Hello, cangjie server.".toArray()
            client.close()
            client.send(msg_send, 0)
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
        server.close()
    }

    @TestCase
    func receive_after_close(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        let array: Array<Byte> = [2, 0, 39, 43, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(0)
        spawn {
            client.connect(s_addr)
            let msg_send: Array<Byte> = "Hello, cangjie server.".toArray()
            client.send(msg_send, 0)
            client.close()
        }
        let com_srv = server.accept()
        try {
            let msg_receive = Array<Byte>(100, repeat: 0)
            com_srv.close()
            com_srv.receive(msg_receive, 0)
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
        server.close()
    }

    @TestCase
    func sendTo_after_close(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let array: Array<Byte> = [2, 0, 39, 44, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        try {
            let msg_send: Array<Byte> = "Hello, cangjie server.".toArray()
            client.close()
            client.sendTo(s_addr, msg_send, 0)
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
        server.close()
    }

    @TestCase
    func recvFrom_after_close(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let array: Array<Byte> = [2, 0, 39, 45, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        spawn {
            let msg_send: Array<Byte> = "Hello, cangjie server.".toArray()
            try {
                client.sendTo(s_addr, msg_send, 0)
            } catch (e: Exception) {}
            client.close()
        }

        try {
            server.close()
            let msg_receive = Array<Byte>(100, repeat: 0)
            server.receiveFrom(msg_receive, 0)
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
        server.close()
    }

    @TestCase
    func getAddress_after_close(): Unit {
        let rs = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        rs.close()
        try {
            rs.localAddr.addr
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }

        try {
            rs.remoteAddr.addr
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
    }

    @TestCase
    func getAndSetTimeout_after_close(): Unit {
        let rs = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        rs.close()
        try {
            rs.readTimeout
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }

        try {
            rs.writeTimeout
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }

        try {
            rs.readTimeout = Duration.second
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }

        try {
            rs.writeTimeout = Duration.second
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
    }

    @TestCase
    func getSetOptionValue_after_close(): Unit {
        let rs = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        rs.close()
        // set Option value
        let setVal: Array<Byte> = [1, 0, 0, 0]
        let setHd = unsafe { acquireArrayRawData(setVal) }
        try {
            unsafe { rs.setSocketOption(OptionLevel.SOCKET, OptionName.SO_REUSEADDR, setHd.pointer, Int32(setVal.size)) }
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
        unsafe { releaseArrayRawData(setHd) }

        // get Option value
        let gotVal: Array<Byte> = [0, 0, 0, 0]
        let gotHd = unsafe { acquireArrayRawData(gotVal) }
        var size: CPointer<Int32> = LibC.malloc<Int32>(count: 1)
        unsafe { size.write(10) } // the value of size must bigger than or equal to the optVal byte size
        try {
            unsafe { rs.getSocketOption(OptionLevel.SOCKET, OptionName.SO_REUSEADDR, gotHd.pointer, size) }
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
        unsafe { releaseArrayRawData(gotHd) }
        unsafe { LibC.free(size) }
        rs.close()
    }

    @TestCase
    func s1_not_close_s2(): Unit {
        let s1 = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        s1.close()
        let array: Array<Byte> = [2, 0, 39, 18, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        let addr = RawAddress(array)
        // s2 may reuse fd of s1
        let s2 = RawSocket(SocketDomain.IPV4, SocketType.STREAM, ProtocolType.TCP)
        s1.close()
        try {
            s2.bind(addr)
            @Expect(true)
        } catch (e: SocketException) {
            @Expect(false)
        }
    }
}
