/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
////import stdx.crypto.kit.*
import stdx.crypto.keys.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.{X509Certificate,PrivateKey}
import std.math.*
import std.fs.*
import std.io.*

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), PrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.alpnProtocolsList = ["h2"]
    tlsConfig
}

@Test
public class Test_transportConfig_h2 {
    @TestCase
    func default(): Unit {
        var cfg = TransportConfig()
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).transportConfig(cfg).build()
        @Expect(server.transportConfig.readTimeout, Duration.Max)
        @Expect(server.transportConfig.writeTimeout, Duration.Max)
        @Expect(server.transportConfig.writeBufferSize, None)
        @Expect(server.transportConfig.readBufferSize, None)
        @Expect(server.transportConfig.keepAliveConfig.idle, Duration.second * 45)
        @Expect(server.transportConfig.keepAliveConfig.interval, Duration.second * 5)
        @Expect(server.transportConfig.keepAliveConfig.count, 5)
    }

    @TestCase
    func readTimeout_01(): Unit {
        var cfg = TransportConfig()
        cfg.readTimeout = Duration.Max
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).transportConfig(cfg).build()
        @Expect(server.transportConfig.readTimeout, Duration.Max)
    }

    @TestCase
    func readTimeout_02(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        var cfg = TransportConfig()
        cfg.readTimeout = Duration.Zero
        let server = ServerBuilder().listener(serverSocket).tlsConfig(serverConfig()).transportConfig(cfg).build()
        @Expect(server.transportConfig.readTimeout, Duration.Zero)
    }

    @TestCase
    func readTimeout_03(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        var cfg = TransportConfig()
        cfg.readTimeout = Duration.Min
        let server = ServerBuilder().listener(serverSocket).tlsConfig(serverConfig()).transportConfig(cfg).build()
        @Expect(server.transportConfig.readTimeout, Duration.Zero)
    }

    @TestCase
    func writeTimeout_01(): Unit {
        var cfg = TransportConfig()
        cfg.writeTimeout = Duration.Max
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).transportConfig(cfg).build()
        @Expect(server.transportConfig.writeTimeout, Duration.Max)
    }

    @TestCase
    func writeTimeout_02(): Unit {
        var cfg = TransportConfig()
        cfg.writeTimeout = Duration.Zero
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).transportConfig(cfg).build()
        @Expect(server.transportConfig.writeTimeout, Duration.Zero)
    }

    @TestCase
    func writeTimeout_03(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        var cfg = TransportConfig()
        cfg.writeTimeout = Duration.Min
        let server = ServerBuilder().listener(serverSocket).tlsConfig(serverConfig()).transportConfig(cfg).build()
        @Expect(server.transportConfig.writeTimeout, Duration.Zero)
    }

    @TestCase
    func writeBufferSize_01(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        var cfg = TransportConfig()
        cfg.writeBufferSize = Int64.Max
        let server = ServerBuilder().listener(serverSocket).tlsConfig(serverConfig()).transportConfig(cfg).build()
        @Expect(server.transportConfig.writeBufferSize, Int64.Max)
    }

    @TestCase
    func writeBufferSize_02(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        var cfg = TransportConfig()
        cfg.writeBufferSize = 0
        let server = ServerBuilder().listener(serverSocket).tlsConfig(serverConfig()).transportConfig(cfg).build()
        @Expect(server.transportConfig.writeBufferSize, 0)
    }

    @TestCase
    func writeBufferSize_03(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        var cfg = TransportConfig()
        cfg.writeBufferSize = Int64.Min
        let server = ServerBuilder().listener(serverSocket).transportConfig(cfg).tlsConfig(serverConfig()).build()
        @Expect(server.transportConfig.writeBufferSize, Int64.Min)
    }

    @TestCase
    func readBufferSize_01(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        var cfg = TransportConfig()
        cfg.readBufferSize = Int64.Max
        let server = ServerBuilder().listener(serverSocket).tlsConfig(serverConfig()).transportConfig(cfg).build()
        @Expect(server.transportConfig.readBufferSize, Int64.Max)
    }

    @TestCase
    func readBufferSize_02(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        var cfg = TransportConfig()
        cfg.readBufferSize = 0
        let server = ServerBuilder().listener(serverSocket).tlsConfig(serverConfig()).transportConfig(cfg).build()
        @Expect(server.transportConfig.readBufferSize, 0)
    }

    @TestCase
    func readBufferSize_03(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        var cfg = TransportConfig()
        cfg.readBufferSize = Int64.Min
        let server = ServerBuilder().listener(serverSocket).tlsConfig(serverConfig()).transportConfig(cfg).build()
        @Expect(server.transportConfig.readBufferSize, Int64.Min)
    }
}
