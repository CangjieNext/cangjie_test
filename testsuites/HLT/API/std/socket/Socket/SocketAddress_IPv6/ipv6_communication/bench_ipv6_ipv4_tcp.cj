/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
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
    var socketaddress_ipv6 = IPSocketAddress(IPv6Address.localhost, 0)
    var socketaddress_ipv4 = IPSocketAddress("127.0.0.1", 0)
    var port = AtomicUInt16(0)
    var ser = Option<TcpServerSocket>.None
    var data = Array<Byte>(64 * 1024 * 1024, repeat: 10)

    func startTcpServer(addr: SocketAddress): Unit {
        var server = TcpServerSocket(bindAt: addr)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        ser = Option<TcpServerSocket>.Some(server)
        var serversocket = server.accept(timeout: 3 * Duration.second)
        serversocket.write(data)
    }

    func startTcpClient(addr: SocketAddress): Float64 {
        var client = TcpSocket(addr)
        client.connect(timeout: 2 * Duration.second)
        var readnum = 0
        var buf = Array<Byte>(64 * 1024 * 1024, repeat: 0)
        let startTime = DateTime.now()
        while (readnum < data.size) {
            var readlen = client.read(buf)
            readnum += readlen
        }
        let endTime = DateTime.now()
        @Expect(data.size, readnum)

        client.close()
        return Float64((endTime - startTime).toNanoseconds()) / 1000000.0
    }

    @TestCase
    func test_ipv6_tcpsocket(): Unit {
        spawn {
            startTcpServer(socketaddress_ipv6)
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var timeDuration1 = startTcpClient(IPSocketAddress(IPv6Address.localhost, port.load()))
        ser.getOrThrow().close()

        spawn {
            startTcpServer(socketaddress_ipv4)
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var timeDuration2 = startTcpClient(IPSocketAddress("127.0.0.1", port.load()))
        ser.getOrThrow().close()
        println("ipv6_time: ${timeDuration1}")
        println("ipv4_time: ${timeDuration2}")
        @Expect(timeDuration1/timeDuration2 < 6.0)
    }
}
