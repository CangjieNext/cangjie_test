/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import stdx.net.http.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.X509Certificate
import stdx.log.*
import std.io.*
import std.net.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestTlsSocketServer {
    var server: ?Server = None

    @TestCase
    func tls(): Unit {
        startServer()
        var cfg = clientConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().tlsConfig(cfg).build()
        let rsp = client.get("https://127.0.0.1:${(server?.port).getOrThrow()}")
        println(rsp)
        client.close()
        server?.close()
        asanGC()
    }

    func startServer() {
        var cfg = serverConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let tlsListener = MyTlsSocketServer(TCP, 0, cfg)
        server = ServerBuilder().listener(tlsListener).tlsConfig(cfg).build()
        server?.logger.level = LogLevel.TRACE
        spawn {
            server?.serve()
        }
        let serevrAlpn = (server?.getTlsConfig()).getOrThrow()?.supportedAlpnProtocols ?? Array<String>()
        @Expect(serevrAlpn.get(0), "http/1.1")
        sleep(Duration.second)
    }
}

public class MyTlsSocketServer <: ServerSocket & ToString & Resource {
    private var socketServer_: TcpServerSocket
    private var cfg: TlsServerConfig
    private var closed: Bool = true

    /*
     * @throws TlsException while net is "UDP", or context_ is null,
     * or the CA file is set failed, or the certificate chain file is set failed,
     * or the private key file is set failed, or the certificate chain dose not match the private key,
     * or the minVersion and maxVersion are not set together,
     * or proto versions is set failed, or the tls verify mode is set failed,
     * or the length of sessionId exceed 32 bytes, or the sessionId is set failed.
     * @throws TlsException while cipher suites of TLS1.2 is set failed,
     * or the TLS versions does not contain 1.2 if cipherSuitesV1_2 is not empty.
     * @throws TlsException while cipher suites of TLS1.3 is set failed,
     * or the TLS versions does not contain 1.3 if cipherSuitesV1_3 is not empty.
     * @throws TlsException while the server alpn protocol is set failed if alpnList is not empty.
     * @throws SocketException while address's size is not match the SocketAddressKind,
     * or some system errors are happened.
     * @throws Exception while malloc socket address is failed.
     */
    public init(net: SocketNet, port: UInt16, cfg: TlsServerConfig) {
        match (net) {
            case TCP => ()
            case _ => throw TlsException("TLS does only support TCP.")
        }
        this.socketServer_ = TcpServerSocket(bindAt: port)
        this.cfg = cfg
        this.closed = false
    }

    /*
     * @throws TlsException while net is "UDP", or context_ is null,
     * or the CA file is set failed, or the certificate chain file is set failed,
     * or the private key file is set failed, or the certificate chain dose not match the private key,
     * or the minVersion and maxVersion are not set together,
     * or proto versions is set failed, or the tls verify mode is set failed,
     * or the length of sessionId exceed 32 bytes, or the sessionId is set failed.
     * @throws TlsException while cipher suites of TLS1.2 is set failed,
     * or the TLS versions does not contain 1.2 if cipherSuitesV1_2 is not empty.
     * @throws TlsException while cipher suites of TLS1.3 is set failed,
     * or the TLS versions does not contain 1.3 if cipherSuitesV1_3 is not empty.
     * @throws TlsException while the server alpn protocol is set failed if alpnList is not empty.
     * @throws SocketException while parsing address is failed,
     * or address's size is not match the SocketAddressKind,
     * or some system errors are happened.
     * @throws Exception while malloc socket address is failed.
     */
    public init(net: SocketNet, address: String, port: UInt16, cfg: TlsServerConfig) {
        match (net) {
            case TCP => ()
            case _ => throw TlsException("TLS does only support TCP.")
        }
        this.socketServer_ = TcpServerSocket(bindAt: IPSocketAddress(address, port))
        this.cfg = cfg
        this.closed = false
    }

    /*
        prop
     */

    /* Gets the port. */
    public prop port: UInt16 {
        get() {
            (localAddress as IPSocketAddress)?.port ?? 0
        }
    }

    /* Gets the bound address. */
    public prop address: SocketAddress {
        get() {
            localAddress
        }
    }

    public prop config: TlsServerConfig {
        get() {
            return this.cfg
        }
    }

    public prop socketServer: TcpServerSocket {
        get() {
            return this.socketServer_
        }
    }

    public override prop localAddress: SocketAddress {
        get() {
            socketServer_.localAddress
        }
    }

    public override func bind(): Unit {
        socketServer_.bind()
    }

    /*
     * @throws TlsException If the accepting fails
     * @throws SocketException while socket server is closed,
     * or address's size is not match the SocketAddressKind,
     * or some system errors are happened.
     * @throws Exception while malloc socket address is failed.
     */
    public override func accept(): TlsSocket {
        return accept(timeout: None)
    }

    /*
     * @compatibility
     * @throws TlsException If the accepting fails
     * @throws TlsTimeOutException if timeout is less than and equal to zero
     * @throws TlsTimeOutException if accepting times out
     */
    public func accept(timeout: Duration): TlsSocket {
        return accept(timeout: timeout)
    }

    public override func accept(timeout!: ?Duration): TlsSocket {
        let socket = match (timeout) {
            case Some(timeout) => socketServer_.accept(timeout: timeout)
            case None => socketServer_.accept()
        }

        let clientTls = TlsSocket.server(socket, serverConfig: cfg)
        try {
            clientTls.handshake()
            return clientTls
        } catch (e: Exception) {
            clientTls.close()
            throw e
        }
    }

    public func close(): Unit {
        if (this.closed) {
            return
        }
        this.socketServer_.close()
        this.closed = true
    }

    public func isClosed(): Bool {
        return this.closed
    }

    public func toString(): String {
        return "TlsSocketServer[${this.socketServer_.localAddress}]"
    }
}
/* SCAN-IN
HTTP/1.1 404 Not Found
 */
