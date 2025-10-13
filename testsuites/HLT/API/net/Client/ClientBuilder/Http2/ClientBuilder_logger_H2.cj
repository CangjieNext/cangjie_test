/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import stdx.encoding.url.*
import stdx.net.http.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.fs.*
import std.io.*

public func serverConfig(): TlsServerConfig {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_rsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_rsa_private_key.pem", Read)))
    var tlsConfig = TlsServerConfig(X509Certificate.decodeFromPem(pem0), GeneralPrivateKey.decodeFromPem(pem02))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

public func clientConfig(): TlsClientConfig {
    var tlsConfig = TlsClientConfig()
    let pem = String.fromUtf8(readToEnd(File("./files/root_rsa.cer", Read)))
    tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(pem).map({c => c}))
    tlsConfig.supportedAlpnProtocols = ["h2"]
    tlsConfig
}

@Test
public class Test_logger {
    @TestCase
    func default(): Unit {
        let client = ClientBuilder().tlsConfig(clientConfig()).build()
        @Expect(client.logger.level.toString(), "INFO")
    }

    @TestCase
    func off(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.OFF
        @Assert(logger.level.toString(), "OFF")
        let client = ClientBuilder().logger(logger).tlsConfig(clientConfig()).build()
        @Expect(client.logger.level.toString(), "OFF")
    }

    @TestCase
    func error(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.ERROR
        @Assert(logger.level.toString(), "ERROR")
        let client = ClientBuilder().logger(logger).tlsConfig(clientConfig()).build()
        @Expect(client.logger.level.toString(), "ERROR")
    }

    @TestCase
    func WARN(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.WARN
        @Assert(logger.level.toString(), "WARN")
        let client = ClientBuilder().logger(logger).tlsConfig(clientConfig()).build()
        @Expect(client.logger.level.toString(), "WARN")
    }

    @TestCase
    func INFO(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.INFO
        @Assert(logger.level.toString(), "INFO")
        let client = ClientBuilder().logger(logger).tlsConfig(clientConfig()).build()
        @Expect(client.logger.level.toString(), "INFO")
    }

    @TestCase
    func DEBUG(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.DEBUG
        @Assert(logger.level.toString(), "DEBUG")
        let client = ClientBuilder().logger(logger).tlsConfig(clientConfig()).build()
        @Expect(client.logger.level.toString(), "DEBUG")
    }

    @TestCase
    func TRACE(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.TRACE
        @Assert(logger.level.toString(), "TRACE")
        let client = ClientBuilder().logger(logger).tlsConfig(clientConfig()).build()
        @Expect(client.logger.level.toString(), "TRACE")
    }

    @TestCase
    func ALL(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.ALL
        @Assert(logger.level.toString(), "ALL")
        let client = ClientBuilder().logger(logger).tlsConfig(clientConfig()).build()
        @Expect(client.logger.level.toString(), "ALL")
    }
}
