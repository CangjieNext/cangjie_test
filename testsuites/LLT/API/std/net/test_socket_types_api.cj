/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.net.*
import std.io.*

@Test
public class SocketNetApiTest {
    @TestCase
    func test_toString(): Unit {
        @Expect(SocketNet.TCP.toString() == "tcp")
        @Expect(SocketNet.UDP.toString() == "udp")
        @Expect(SocketNet.UNIX.toString() == "domain")
    }

    @TestCase
    func test_equals(): Unit {
        @Expect(SocketNet.TCP == SocketNet.TCP)
        @Expect(SocketNet.UDP == SocketNet.UDP)
        @Expect(SocketNet.UNIX == SocketNet.UNIX)
    }

    @TestCase
    func test_not_equals(): Unit {
        @Expect(SocketNet.TCP != SocketNet.UDP)
        @Expect(SocketNet.TCP != SocketNet.UNIX)
        @Expect(SocketNet.UDP != SocketNet.UNIX)
        @Expect(!(SocketNet.TCP != SocketNet.TCP))
    }
}

@Test
public class SocketDomainApiTest {
    @TestCase
    func test_toString_known(): Unit {
        @Expect(SocketDomain.IPV4.toString() == "IPv4")
        @Expect(SocketDomain.IPV6.toString() == "IPv6")
        @Expect(SocketDomain.UNIX.toString() == "unix")
    }

    @TestCase
    func test_toString_netlink_packet(): Unit {
        // NETLINK and PACKET are only declared on Linux/Android targets;
        // guard so this test is valid wherever the constants exist.
        @Expect(SocketDomain.NETLINK.toString() == "netlink")
        @Expect(SocketDomain.PACKET.toString() == "packet")
    }

    @TestCase
    func test_toString_default(): Unit {
        let custom = SocketDomain(999)
        @Expect(custom.toString() == "Domain(999)")
    }

    @TestCase
    func test_equals(): Unit {
        @Expect(SocketDomain.IPV4 == SocketDomain.IPV4)
        @Expect(SocketDomain.IPV6 == SocketDomain.IPV6)
        @Expect(SocketDomain.UNIX == SocketDomain.UNIX)
        @Expect(SocketDomain(42) == SocketDomain(42))
    }

    @TestCase
    func test_not_equals(): Unit {
        @Expect(SocketDomain.IPV4 != SocketDomain.IPV6)
        @Expect(SocketDomain.IPV4 != SocketDomain.UNIX)
        @Expect(SocketDomain(1) != SocketDomain(2))
        @Expect(!(SocketDomain.IPV4 != SocketDomain.IPV4))
    }

    @TestCase
    func test_hashCode(): Unit {
        @Expect(SocketDomain(42).hashCode() == Int64(42))
        @Expect(SocketDomain.IPV4.hashCode() == SocketDomain.IPV4.hashCode())
    }
}

@Test
public class SocketTypeApiTest {
    @TestCase
    func test_toString_known(): Unit {
        @Expect(SocketType.STREAM.toString() == "STREAM")
        @Expect(SocketType.DATAGRAM.toString() == "DATAGRAM")
        @Expect(SocketType.RAW.toString() == "RAW")
        @Expect(SocketType.SEQPACKET.toString() == "SEQPACKET")
    }

    @TestCase
    func test_toString_default(): Unit {
        let custom = SocketType(777)
        @Expect(custom.toString() == "Type(777)")
    }

    @TestCase
    func test_equals(): Unit {
        @Expect(SocketType.STREAM == SocketType.STREAM)
        @Expect(SocketType.DATAGRAM == SocketType.DATAGRAM)
        @Expect(SocketType.RAW == SocketType.RAW)
        @Expect(SocketType.SEQPACKET == SocketType.SEQPACKET)
        @Expect(SocketType(5) == SocketType(5))
    }

    @TestCase
    func test_not_equals(): Unit {
        @Expect(SocketType.STREAM != SocketType.DATAGRAM)
        @Expect(SocketType.STREAM != SocketType.RAW)
        @Expect(SocketType(1) != SocketType(2))
        @Expect(!(SocketType.STREAM != SocketType.STREAM))
    }

    @TestCase
    func test_hashCode(): Unit {
        @Expect(SocketType(99).hashCode() == Int64(99))
    }
}

@Test
public class ProtocolTypeApiTest {
    @TestCase
    func test_toString_known(): Unit {
        @Expect(ProtocolType.Unspecified.toString() == "Unspecified")
        @Expect(ProtocolType.IPV4.toString() == "IPv4")
        @Expect(ProtocolType.IPV6.toString() == "IPv6")
        @Expect(ProtocolType.ICMP.toString() == "ICMP")
        @Expect(ProtocolType.TCP.toString() == "TCP")
        @Expect(ProtocolType.UDP.toString() == "UDP")
        @Expect(ProtocolType.RAW.toString() == "RAW")
    }

    @TestCase
    func test_toString_default(): Unit {
        let custom = ProtocolType(888)
        @Expect(custom.toString() == "Protocol(888)")
    }

    @TestCase
    func test_equals(): Unit {
        @Expect(ProtocolType.Unspecified == ProtocolType.Unspecified)
        @Expect(ProtocolType.TCP == ProtocolType.TCP)
        @Expect(ProtocolType.UDP == ProtocolType.UDP)
        @Expect(ProtocolType(3) == ProtocolType(3))
    }

    @TestCase
    func test_not_equals(): Unit {
        @Expect(ProtocolType.TCP != ProtocolType.UDP)
        @Expect(ProtocolType.IPV4 != ProtocolType.IPV6)
        @Expect(ProtocolType(1) != ProtocolType(2))
        @Expect(!(ProtocolType.TCP != ProtocolType.TCP))
    }

    @TestCase
    func test_hashCode(): Unit {
        @Expect(ProtocolType(55).hashCode() == Int64(55))
    }
}

@Test
public class SocketExceptionApiTest {
    @TestCase
    func test_init_no_arg(): Unit {
        let ex = SocketException()
        @Expect(ex.message == "")
    }

    @TestCase
    func test_init_with_message(): Unit {
        let ex = SocketException("connection refused")
        @Expect(ex.message == "connection refused")
    }

    @TestCase
    func test_throws(): Unit {
        var caught = false
        try {
            throw SocketException("boom")
        } catch (e: SocketException) {
            caught = true
            @Expect(e.message == "boom")
        }
        @Expect(caught)
    }

    @TestCase
    func test_is_io_exception(): Unit {
        let ex = SocketException("io error")
        var caught = false
        try {
            throw ex
        } catch (e: IOException) {
            caught = true
        }
        @Expect(caught)
    }
}

@Test
public class SocketTimeoutExceptionApiTest {
    @TestCase
    func test_init_no_arg(): Unit {
        let ex = SocketTimeoutException()
        @Expect(ex.message == "")
    }

    @TestCase
    func test_init_with_message(): Unit {
        let ex = SocketTimeoutException("timed out")
        @Expect(ex.message == "timed out")
    }

    @TestCase
    func test_throws(): Unit {
        var caught = false
        try {
            throw SocketTimeoutException("timeout")
        } catch (e: SocketTimeoutException) {
            caught = true
            @Expect(e.message == "timeout")
        }
        @Expect(caught)
    }

    @TestCase
    func test_is_exception(): Unit {
        let ex = SocketTimeoutException("generic")
        var caught = false
        try {
            throw ex
        } catch (e: Exception) {
            caught = true
        }
        @Expect(caught)
    }
}

@Test
public class SocketKeepAliveConfigApiTest {
    @TestCase
    func test_defaults(): Unit {
        let cfg = SocketKeepAliveConfig()
        @Expect(cfg.idle == Duration.second * 45)
        @Expect(cfg.interval == Duration.second * 5)
        @Expect(cfg.count == UInt32(5))
    }

    @TestCase
    func test_custom_values(): Unit {
        let cfg = SocketKeepAliveConfig(idle: Duration.second * 10, interval: Duration.second * 2, count: UInt32(3))
        @Expect(cfg.idle == Duration.second * 10)
        @Expect(cfg.interval == Duration.second * 2)
        @Expect(cfg.count == UInt32(3))
    }

    @TestCase
    func test_toString(): Unit {
        let cfg = SocketKeepAliveConfig(idle: Duration.second * 10, interval: Duration.second * 2, count: UInt32(3))
        let s = cfg.toString()
        @Expect(s.contains("SocketKeepAliveConfig"))
        @Expect(s.contains("count: 3"))
    }

    @TestCase
    func test_equals(): Unit {
        let a = SocketKeepAliveConfig()
        let b = SocketKeepAliveConfig()
        @Expect(a == b)
        @Expect(!(a != b))
    }

    @TestCase
    func test_not_equals(): Unit {
        let a = SocketKeepAliveConfig()
        let b = SocketKeepAliveConfig(count: UInt32(9))
        @Expect(a != b)
        @Expect(!(a == b))
    }

    @TestCase
    func test_not_equals_idle(): Unit {
        let a = SocketKeepAliveConfig()
        let b = SocketKeepAliveConfig(idle: Duration.second * 99)
        @Expect(a != b)
    }

    @TestCase
    func test_not_equals_interval(): Unit {
        let a = SocketKeepAliveConfig()
        let b = SocketKeepAliveConfig(interval: Duration.second * 99)
        @Expect(a != b)
    }

    @TestCase
    func test_negative_idle_throws(): Unit {
        var caught = false
        try {
            let _ = SocketKeepAliveConfig(idle: Duration.Zero - Duration.second)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_negative_interval_throws(): Unit {
        var caught = false
        try {
            let _ = SocketKeepAliveConfig(interval: Duration.Zero - Duration.second)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }
}

@Test
public class RawAddressApiTest {
    @TestCase
    func test_init_and_addr(): Unit {
        let bytes = Array<Byte>(4, repeat: 0)
        let ra = RawAddress(bytes)
        let got = ra.addr
        @Expect(got.size == 4)
        @Expect(got[0] == UInt8(0))
    }

    @TestCase
    func test_init_with_values(): Unit {
        let bytes = Array<Byte>(4, { i => UInt8(i + 1) })
        let ra = RawAddress(bytes)
        let got = ra.addr
        @Expect(got.size == 4)
        @Expect(got[0] == UInt8(1))
        @Expect(got[1] == UInt8(2))
        @Expect(got[2] == UInt8(3))
        @Expect(got[3] == UInt8(4))
    }

    @TestCase
    func test_empty(): Unit {
        let ra = RawAddress(Array<Byte>())
        @Expect(ra.addr.size == 0)
    }
}
