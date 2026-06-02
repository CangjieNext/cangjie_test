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

@Test
public class Test_Ipv6_Communication {
    let socketaddress = IPSocketAddress(IPv6Address.localhost, 0)
    var port = AtomicUInt16(0)
    var data = Array<Byte>(50, repeat: 10)

    @TestCase
    func test_ipv6_Udpsocket_connect(): Unit {
        var server = UdpSocket(bindAt: socketaddress)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)

        var client = UdpSocket(bindAt: IPSocketAddress(IPv6Address.localhost, 0))
        client.bind()
        client.connect(IPSocketAddress(IPv6Address.localhost, port.load()))
        server.connect(IPSocketAddress(IPv6Address.localhost, (client.localAddress as IPSocketAddress)?.port ?? 0))
        client.send(data)

        var buf = Array<Byte>(100, repeat: 0)
        server.receive(buf)
        @Expect(data, buf[0..50])
        @Expect(buf[50], 0)
        client.close()
        server.close()
    }

    @TestCase
    func test_ipv6_Udpsocket_unconnected(): Unit {
        var server = UdpSocket(bindAt: socketaddress)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)

        var client = UdpSocket(bindAt: IPSocketAddress(IPv6Address.localhost, 0))
        client.bind()
        client.sendTo(IPSocketAddress(IPv6Address.localhost, port.load()), data)

        var buf = Array<Byte>(100, repeat: 0)
        server.receiveFrom(buf)
        @Expect(data, buf[0..50])
        @Expect(buf[50], 0)
        client.close()
        server.close()
    }
}
