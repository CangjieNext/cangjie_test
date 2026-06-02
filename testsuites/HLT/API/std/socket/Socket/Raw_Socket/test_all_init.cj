/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows and not MAC)DEPENDENCE: ./test_all_init.c
// (not Windows and not MAC)EXEC: gcc test_all_init.c -o test && ./test > log.txt
// (not Windows and not MAC)DEPENDENCE: ../../../asan
// (not Windows and not MAC)EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// (not Windows and not MAC)EXEC: %compiler %cmp_opt asan.%middle %f -o %output %cmp_utest_opt
// (not Windows and not MAC)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description:
 *      test all
 * Test API:
 *      public init(domain: SocketDomain, type: SocketType, protocol: ProtocolType)
 */

import std.net.*
import std.fs.*
import std.convert.*

@Test
class Test_RawSocket_Init {
    var c_count = 0

    public override func beforeAll(): Unit {
        var content = String.fromUtf8(File.readFrom("log.txt"))
        c_count = Int64.tryParse(content).getOrThrow()
    }

    @TestCase
    func case01(): Unit {
        var domains: Array<SocketDomain> = [SocketDomain.IPV4, SocketDomain.IPV6, SocketDomain.UNIX,
            SocketDomain.NETLINK, SocketDomain.PACKET]
        var types: Array<SocketType> = [SocketType.STREAM, SocketType.DATAGRAM, SocketType.RAW, SocketType.SEQPACKET]
        var protocols: Array<ProtocolType> = [ProtocolType.IPV4, ProtocolType.IPV6, ProtocolType.ICMP, ProtocolType.TCP,
            ProtocolType.UDP, ProtocolType.RAW]
        var count = 0
        for (domain in domains) {
            for (type0 in types) {
                for (protocol in protocols) {
                    try {
                        var _ = RawSocket(domain, type0, protocol)
                    } catch (e: SocketException) {
                        count += 1
                    }
                }
            }
        }
        @Expect(count == 0, false)
        @Expect(count, c_count)
    }
}
