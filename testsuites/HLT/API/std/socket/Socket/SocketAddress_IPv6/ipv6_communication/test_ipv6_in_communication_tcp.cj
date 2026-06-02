/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.net.*
import std.sync.*
import std.time.*

var bound = AtomicUInt16(0)

@Test
public class Test_Ipv6_Communication {
    public override func beforeEach(): Unit {
        bound = AtomicUInt16(0)
    }

    let socketaddress = IPSocketAddress(IPv6Address.localhost, 0)
    var port = AtomicUInt16(0)
    var ser = Option<TcpServerSocket>.None
    var data = Array<Byte>(50, repeat: 10)

    func startTcpServer(): Unit {
        var server = TcpServerSocket(bindAt: socketaddress)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        ser = Option<TcpServerSocket>.Some(server)
        var serversocket = server.accept(timeout: 3 * Duration.second)
        sleep(300 * Duration.millisecond)
        serversocket.write(data)
    }

    @TestCase
    func test_ipv6_tcpsocket(): Unit {
        spawn {
            startTcpServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }

        var client = TcpSocket(IPSocketAddress(IPv6Address.localhost, port.load()))
        client.connect(timeout: 2 * Duration.second)
        var readnum = 0
        var buf = Array<Byte>(100, repeat: 0)
        while (readnum < data.size) {
            var readlen = client.read(buf)
            readnum += readlen
        }
        @Expect(data.size, readnum)
        client.close()
        ser.getOrThrow().close()
    }
}
