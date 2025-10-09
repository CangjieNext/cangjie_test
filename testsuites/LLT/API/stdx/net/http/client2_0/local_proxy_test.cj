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
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description: test when proxy and client are same ip
 *
 * Test API:
 *
 */

package tests.client2_0

import stdx.net.http.*
import stdx.log.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.time.*
import std.net.*
import std.random.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}
import std.convert.*

@Test
class TestLocalProxy {

	let proxyServerSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func proxy(): Unit {
        let server = startServer1()

		spawn { startProxy(server.port) }

        sleep(Duration.millisecond * 100)
		let port1 = (proxyServerSocket.localAddress as IPSocketAddress)?.port ?? 0
        println("=============local_proxy_test port1 = " + port1.toString())
		var cfg = clientConfig()
        cfg.supportedAlpnProtocols = ["h2"]
		let client = ClientBuilder()
			.tlsConfig(cfg)
			.httpsProxy("http://127.0.0.1:${port1}")
			.build()
		let req = HttpRequestBuilder()
			.version(HTTP2_0)
			.url("https://127.0.0.1:${server.port}")
			.body("hello proxy")
			.build()
		let resp = client.send(req)
		client.close()
        server.close()
		asanGC()
	}

    func startServer1(): Server {
        var transportCfg = TransportConfig()
        transportCfg.readBufferSize = 8192
        var cfg = serverConfig()
        cfg.supportedAlpnProtocols = ["h2"]
        let server = ServerBuilder()
                    .addr("127.0.0.1")
                    .port(0)
                    .transportConfig(transportCfg)
                    .tlsConfig(cfg)
                    .headerTableSize(10 * 1024)
                    .maxRequestHeaderSize(1024 * 1024)
                    .build()
        server.distributor.register("", {httpContext =>
            httpContext.responseBuilder.body("Hello!")
        })
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond*100)
        return server
	}


    func startProxy(serverPort: UInt16) {
        try{
            proxyServerSocket.bind()
            sleep(Duration.millisecond * 200)
            let port1 = (proxyServerSocket.localAddress as IPSocketAddress)?.port ?? 0
            let socket = proxyServerSocket.accept()
            socket.readTimeout = Duration.millisecond * 100
        
            let buf = Array<UInt8>(500, repeat: 0)
            sleep(Duration.millisecond * 100)
            let i = socket.read(buf)
            let read = String.fromUtf8(buf[0..i])
            @Expect(read.contains("CONNECT 127.0.0.1:${serverPort} HTTP/1.1"))
            @Expect(read.contains("host: 127.0.0.1:${serverPort}"))
            @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1"))

            // Resolve the address and port of the target server
            let a:Array<String> = read.split(" ")
            let addrAndPort = a[1].split(":")
            let realServerAddr = addrAndPort[0]
            let realServerPort = addrAndPort[1]

            let remote_socket = TcpSocket(realServerAddr,UInt16.parse(realServerPort))
            remote_socket.connect()

            socket.write("HTTP/1.1 200 Connection Established\r\n\r\n".toArray())

            // Receive messages from the client and send them to the target server
            spawn{
                while(true){
                    let buf1 = Array<UInt8>(5000, repeat: 0)
                    let i1 = socket.read(buf1)
                    if(i1 <= 0){
                        break
                    }else{
                        remote_socket.write(buf1[0..i1])
                    }
                }
            }
            
            spawn{
                while(true){
                    let buf1 = Array<UInt8>(5000, repeat: 0)
                    let i1 = remote_socket.read(buf1)
                    if(i1 <= 0){
                        break
                    }else{
                        socket.write(buf1[0..i1])
                    }
                }
            }
            sleep(Duration.second * 3)
            proxyServerSocket.close()
        } catch (e: Exception) {
            proxyServerSocket.close()
        }
    }
}
