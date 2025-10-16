/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.collection.*
import stdx.net.http.*
import stdx.crypto.kit.*
import stdx.crypto.keys.*
import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.math.*
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
public class Test_logger_h2 {
    @TestCase
    func logger_default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).build()
        @Expect(server.logger.level.toString(), "INFO")
        server.close()
    }

    @TestCase
    func logger_off(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.OFF
        @Assert(logger.level.toString(), "OFF")
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).logger(logger).build()
        @Expect(server.logger.level.toString(), "OFF")
        server.close()
    }

    @TestCase
    func logger_error(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.ERROR
        @Assert(logger.level.toString(), "ERROR")
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).logger(logger).build()
        @Expect(server.logger.level.toString(), "ERROR")
        server.close()
    }

    @TestCase
    func logger_warn(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.WARN
        @Assert(logger.level.toString(), "WARN")
        let server = ServerBuilder().addr("127.0.0.1").tlsConfig(serverConfig()).port(0).logger(logger).build()
        @Expect(server.logger.level.toString(), "WARN")
        server.close()
    }

    @TestCase
    func logger_info(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.INFO
        @Assert(logger.level.toString(), "INFO")
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).logger(logger).build()
        @Expect(server.logger.level.toString(), "INFO")
        server.close()
    }

    @TestCase
    func logger_debug(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.DEBUG
        @Assert(logger.level.toString(), "DEBUG")
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).logger(logger).build()
        @Expect(server.logger.level.toString(), "DEBUG")
        server.close()
    }

    @TestCase
    func logger_trace(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.TRACE
        @Assert(logger.level.toString(), "TRACE")
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).logger(logger).build()
        @Expect(server.logger.level.toString(), "TRACE")
        server.close()
    }

    @TestCase
    func logger_all(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.ALL
        @Assert(logger.level.toString(), "ALL")
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).logger(logger).build()
        @Expect(server.logger.level.toString(), "ALL")
        server.close()
    }

    @TestCase
    func overwrite(): Unit {
        let logger1 = SimpleLogger(Console.stdOut)
        logger1.level = LogLevel.ALL
        @Assert(logger1.level.toString(), "ALL")
        let logger2 = SimpleLogger(Console.stdOut)
        logger2.level = LogLevel.TRACE
        @Assert(logger2.level.toString(), "TRACE")
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .tlsConfig(serverConfig())
            .logger(logger1)
            .logger(logger2)
            .build()
        @Expect(server.logger.level.toString(), "TRACE")
        server.close()
    }
}
