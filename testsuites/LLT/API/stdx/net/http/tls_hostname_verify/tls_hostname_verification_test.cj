/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -V %f %cmp_utest_opt -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description:
 *     The HTTP client must verify the server certificate against the request
 *     host name when the user has not configured `serverName` explicitly
 *     (issue: HTTPS client accepts certificates for a wrong domain).
 * Test API:
 *       ClientBuilder.tlsConfig / Client.send
 */

package tests.tls_hostname_verify

import std.fs.*
import std.io.*
import std.sync.*
import std.unittest.*
import stdx.crypto.keys.GeneralPrivateKey
import stdx.crypto.x509.X509Certificate
import stdx.net.http.*
import stdx.net.tls.*
import stdx.net.tls.common.*

func readPem(name: String): String {
    String.fromUtf8(readToEnd(File("./files/${name}", Read)))
}

func serverConfig(certName: String, alpn: Array<String>): TlsServerConfig {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(readPem("${certName}.pem")),
        GeneralPrivateKey.decodeFromPem(readPem("${certName}.key")))
    cfg.supportedAlpnProtocols = alpn
    return cfg
}

func clientConfig(alpn: Array<String>): TlsClientConfig {
    var cfg = TlsClientConfig()
    cfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(readPem("hostname_verify_root.pem")).map({ c => c }))
    if (!alpn.isEmpty()) {
        cfg.supportedAlpnProtocols = alpn
    }
    return cfg
}

func startServer(certName: String, alpn: Array<String>): Server {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig(certName, alpn)).build()
    server.distributor.register("/hello", { ctx => ctx.responseBuilder.body("ok") })
    spawn { server.serve() }
    sleep(Duration.millisecond * 200)
    return server
}

func expectAccepted(cfg: TlsClientConfig, url: String): Unit {
    let client = ClientBuilder().noProxy().tlsConfig(cfg).build()
    try {
        let resp = client.send(HttpRequestBuilder().get().url(url).build())
        @Assert(resp.status, 200u16)
    } finally {
        client.close()
    }
}

func expectRejected(cfg: TlsClientConfig, url: String): Unit {
    let client = ClientBuilder().noProxy().tlsConfig(cfg).build()
    try {
        client.send(HttpRequestBuilder().get().url(url).build())
        @Assert(false, true)
    } catch (_: Exception) {
        return
    } finally {
        client.close()
    }
}

@Test
class TestHttpsHostnameVerification {
    @TestCase
    func test_h1_default_rejects_wrong_domain_cert(): Unit {
        let server = startServer("hostname_verify_wrong", ["http/1.1"])
        expectRejected(clientConfig([]), "https://localhost:${server.port}/hello")
        server.close()
    }

    @TestCase
    func test_h1_default_accepts_matching_domain_cert(): Unit {
        let server = startServer("hostname_verify_localhost", ["http/1.1"])
        expectAccepted(clientConfig([]), "https://localhost:${server.port}/hello")
        server.close()
    }

    @TestCase
    func test_h1_default_accepts_ip_san_cert_for_ip_url(): Unit {
        let server = startServer("hostname_verify_ip", ["http/1.1"])
        expectAccepted(clientConfig([]), "https://127.0.0.1:${server.port}/hello")
        server.close()
    }

    @TestCase
    func test_h1_default_rejects_dns_cert_for_ip_url(): Unit {
        let server = startServer("hostname_verify_wrong", ["http/1.1"])
        expectRejected(clientConfig([]), "https://127.0.0.1:${server.port}/hello")
        server.close()
    }

    @TestCase
    func test_explicit_server_name_keeps_user_semantics(): Unit {
        // Explicitly pinning `serverName` to the certificate domain must keep working.
        let server = startServer("hostname_verify_wrong", ["http/1.1"])
        var cfg = clientConfig([])
        cfg.serverName = Some("wrong.test")
        expectAccepted(cfg, "https://localhost:${server.port}/hello")
        server.close()
    }

    @TestCase
    func test_h2_default_rejects_wrong_domain_cert(): Unit {
        let server = startServer("hostname_verify_wrong", ["h2"])
        expectRejected(clientConfig(["h2"]), "https://localhost:${server.port}/hello")
        server.close()
    }

    @TestCase
    func test_h2_default_accepts_matching_domain_cert(): Unit {
        let server = startServer("hostname_verify_localhost", ["h2"])
        expectAccepted(clientConfig(["h2"]), "https://localhost:${server.port}/hello")
        server.close()
    }

    /*
     * Guards the existing tests' pattern (config/tlsconfig.cj): the legacy
     * certificate only carries DNS:oss.PMS.com, and clients pin `serverName`
     * to it explicitly while connecting through an IP URL.
     */
    @TestCase
    func test_legacy_cert_with_explicit_server_name(): Unit {
        var serverCfg = TlsServerConfig(X509Certificate.decodeFromPem(readPem("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(readPem("end_rsa_private_key.pem")))
        serverCfg.supportedAlpnProtocols = ["http/1.1"]
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverCfg).build()
        server.distributor.register("/hello", { ctx => ctx.responseBuilder.body("ok") })
        spawn { server.serve() }
        sleep(Duration.millisecond * 200)

        var cfg = TlsClientConfig()
        cfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(readPem("root_rsa.cer")).map({ c => c }))
        cfg.serverName = Some("oss.PMS.com")
        expectAccepted(cfg, "https://127.0.0.1:${server.port}/hello")
        server.close()
    }
}

main() {
    println("tls hostname verification tests")
}
