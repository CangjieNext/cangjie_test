/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: certs
// DEPENDENCE: mock.c

// EXEC: %clang %clang_opt -Wno-deprecated-declarations -lssl -lcrypto -o mock.%dylib_suffix mock.c
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt -l:mock.%dylib_suffix -L. -o %n.%suffix %f
// RUN-EXEC: export CJ_KEYLESS_DEBUG=1 && %set_stdx_path %run_stdx %run_opt %n.%suffix %run_utest_opt %run_args

import std.fs.{File, OpenMode}
import std.net.{TcpServerSocket, TcpSocket}
import stdx.crypto.x509.{X509Certificate}
import stdx.crypto.keys.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import std.io.*
import std.unittest.*
import std.unittest.testmacro.*

foreign func CJ_TLS_MockDecrypt(
    data: CPointer<Byte>,
    size: Int64,
    pkey: CPointer<Unit>,
    written: CPointer<Int64>
): CPointer<Byte>

foreign func CJ_TLS_MockSign(
    data: CPointer<Byte>,
    size: Int64,
    pkey: CPointer<Unit>,
    written: CPointer<Int64>
): CPointer<Byte>

foreign func der_blob_to_pkey(der: CPointer<UInt8>, der_len: Int64): CPointer<Unit>

private func obtainMockPkey(keyPath: String): CPointer<Unit> {
    let keyText = readTextFromFile(keyPath)
    let der: Array<Byte> = GeneralPrivateKey.decodeFromPem(keyText).encodeToDer().body
    unsafe {
        let derHandle = acquireArrayRawData(der)
        let pk = der_blob_to_pkey(derHandle.pointer, der.size)
        releaseArrayRawData(derHandle)
        return pk
    }
}

private func obtainRsaKey(): CPointer<Unit> {
    return obtainMockPkey("certs/server_rsa.key")
}

private func obtainEcKey(): CPointer<Unit> {
    return obtainMockPkey("certs/server_ecc.key")
}

func mocksignEc(data: Array<Byte>): Array<Byte> {
    unsafe {
        let dataHandle = acquireArrayRawData(data)
        let pkey = obtainEcKey()
        if (pkey.isNull()) {
            releaseArrayRawData(dataHandle)
            return []
        }
        let written = LibC.malloc<Int64>(count: 1)
        let ret: CPointer<Byte> = CJ_TLS_MockSign(dataHandle.pointer, data.size, pkey, written)
        let size = written.read()
        if (ret.isNull() || size <= 0) {
            releaseArrayRawData(dataHandle)
            LibC.free(written)
            if (!ret.isNull()) {
                LibC.free(ret)
            }
            return []
        }
        let arr = Array<Byte>(size, repeat: 0)
        for (i in 0..size) {
            arr[i] = ret.read(i)
        }
        releaseArrayRawData(dataHandle)
        LibC.free(written)
        LibC.free(ret)
        return arr
    }
}

func mockSignRsa(data: Array<Byte>): Array<Byte> {
    unsafe {
        let dataHandle = acquireArrayRawData(data)
        let pkey = obtainRsaKey()
        if (pkey.isNull()) {
            releaseArrayRawData(dataHandle)
            return []
        }
        let written = LibC.malloc<Int64>(count: 1)
        let ret: CPointer<Byte> = CJ_TLS_MockSign(dataHandle.pointer, data.size, pkey, written)
        let size = written.read()
        if (ret.isNull() || size <= 0) {
            releaseArrayRawData(dataHandle)
            LibC.free(written)
            if (!ret.isNull()) {
                LibC.free(ret)
            }
            return []
        }
        let arr = Array<Byte>(size, repeat: 0)
        for (i in 0..size) {
            arr[i] = ret.read(i)
        }
        releaseArrayRawData(dataHandle)
        LibC.free(written)
        LibC.free(ret)
        return arr
    }
}

func mockDecrypt(data: Array<Byte>): Array<Byte> {
  unsafe {
        let dataHandle = acquireArrayRawData(data)
        let pkey = obtainRsaKey()
        if (pkey.isNull()) {
            releaseArrayRawData(dataHandle)
            return []
        }
        let written = LibC.malloc<Int64>(count: 1)
        let ret: CPointer<Byte> = CJ_TLS_MockDecrypt(dataHandle.pointer, data.size, pkey, written)
        let size = written.read()
        if (ret.isNull() || size <= 0) {
            releaseArrayRawData(dataHandle)
            LibC.free(written)
            if (!ret.isNull()) {
                LibC.free(ret)
            }
            return []
        }
        let arr = Array<Byte>(size, repeat: 0)
        for (i in 0..size) {
            arr[i] = ret.read(i)
        }
        releaseArrayRawData(dataHandle)
        LibC.free(written)
        LibC.free(ret)
        return arr
    }
}

var server: ?TlsSocket = None
var serverSocket: ?TcpServerSocket = None
@Test
class Test_TLS_Keyless_ECC_Server_TLS_1_2 {
    var port: UInt16 = 8048
    let pem = readTextFromFile("./certs/server_ecc.crt")
    let certificate = X509Certificate.decodeFromPem(pem)
    let mocksign = mocksignEc

    public override func afterEach(): Unit {
        port += 1
        if (let Some(s) <- server) {
            s.close()
        }
        if (let Some(ss) <- serverSocket) {
            ss.close()
        }
        sleep(Duration.millisecond * 100)
    }

    func startServerHandshake(config: KeylessTlsServerConfig): Unit {
        var ss = TcpServerSocket(bindAt: port)
        ss.bind()
        let stream: TcpSocket = ss.accept()
        let s = TlsSocket.server(stream, serverConfig: config, session: None)
        s.handshake()
        let buffer = Array<Byte>(100, repeat: 0)
        s.read(buffer)
        println("-----Got--------\n ${String.fromUtf8(buffer)} \n---------------------")

        serverSocket = ss
    }

    func serverWrapper(config: KeylessTlsServerConfig) {
        return spawn { 
            try {
                startServerHandshake(config)
            } catch (e: TlsException) {
                return e.message
            }
            return ""
        }
    }

    func clientWrapper(startClientHandshake: () -> Unit) {
        return spawn {
            try {
                startClientHandshake()
            } catch (e: TlsException) {
                return e.message
            }
            return ""
        }
    }

    @TestCase
    func test_keyless_normal(): Unit {
        func startClientHandshake(): Unit {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless ecc client".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }

        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }

    @TestCase
    func test_tls1_2_ecdhe_ecdsa_aes256_gcm_sha384(): Unit {
        func startClientHandshake(): Unit {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            config.supportedCipherSuites[V1_2] = ["ECDHE-ECDSA-AES256-GCM-SHA384"]
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless ecc client with ECDHE-ECDSA-AES256-GCM-SHA384".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }

        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }

    @TestCase
    func test_tls1_2_ecdhe_ecdsa_aes128_gcm_sha256(): Unit {
        func startClientHandshake(): Unit {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            config.supportedCipherSuites[V1_2] = ["ECDHE-ECDSA-AES128-GCM-SHA256"]
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless ecc client with ECDHE-ECDSA-AES128-GCM-SHA256".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }
        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }

    @TestCase
    func test_tls1_2_ecdhe_ecdsa_chacha20_poly1305(): Unit {
        func startClientHandshake(): Unit {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            config.supportedCipherSuites[V1_2] = ["ECDHE-ECDSA-CHACHA20-POLY1305"]
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless ecc client with ECDHE-ECDSA-CHACHA20-POLY1305".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }
        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }
}

@Test
class Test_TLS_Keyless_ECC_Server_TLS_1_3 {
    var port: UInt16 = 8148
    let pem = readTextFromFile("./certs/server_ecc.crt")
    let certificate = X509Certificate.decodeFromPem(pem)
    let mocksign = mocksignEc

    public override func beforeEach(): Unit {
        port += 1
    }
    public override func afterEach(): Unit {
        if (let Some(s) <- server) {
            s.close()
        }
        if (let Some(ss) <- serverSocket) {
            ss.close()
        }
    }
    func startServerHandshake(config: KeylessTlsServerConfig): Unit {
        var ss = TcpServerSocket(bindAt: port)
        ss.bind()
        let stream: TcpSocket = ss.accept()
        let s = TlsSocket.server(stream, serverConfig: config, session: None)
        
        s.handshake()
        let buffer = Array<Byte>(100, repeat: 0)
        s.read(buffer)
        println("-----Got--------\n ${String.fromUtf8(buffer)} \n---------------------")

        serverSocket = ss
    }

    func serverWrapper(config: KeylessTlsServerConfig) {
        return spawn { 
            try {
                startServerHandshake(config)
            } catch (e: TlsException) {
                return e.message
            }
            return ""
        }
    }

    func clientWrapper(startClientHandshake: () -> Unit) {
        return spawn {
            try {
                startClientHandshake()
            } catch (e: TlsException) {
                return e.message
            }
            return ""
        }
    }

    @TestCase
    func test_keyless_normal(): Unit {
        func startClientHandshake(): Unit {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless ecc client".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }

        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }

    @TestCase
    func test_tls1_3_ecdhe_ecdsa_aes256_gcm_sha384(): Unit {
        func startClientHandshake(): Unit {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            config.supportedCipherSuites[V1_3] = ["ECDHE-ECDSA-AES256-GCM-SHA384"]
            config.supportedCipherSuites[V1_2] = []
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless ecc client with ECDHE-ECDSA-AES256-GCM-SHA384".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }
        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }

    @TestCase
    func test_tls1_3_ecdhe_ecdsa_aes128_gcm_sha256(): Unit {
        func startClientHandshake(): Unit {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            config.supportedCipherSuites[V1_3] = ["ECDHE-ECDSA-AES128-GCM-SHA256"]
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless ecc client with ECDHE-ECDSA-AES128-GCM-SHA256".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }
        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }

    @TestCase
    func test_tls1_3_ecdhe_ecdsa_chacha20_poly1305(): Unit {
        func startClientHandshake(): Unit {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            config.supportedCipherSuites[V1_3] = ["ECDHE-ECDSA-CHACHA20-POLY1305"]
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless ecc client with ECDHE-ECDSA-CHACHA20-POLY1305".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }
        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }
}

@Test
class Test_TLS_Keyless_RSA_Server_TLS_1_2 {
    var port: UInt16 = 8248
    let pem = readTextFromFile("./certs/server_rsa.crt")
    let certificate = X509Certificate.decodeFromPem(pem)
    let mocksign = mockSignRsa

    public override func beforeEach(): Unit {
        port += 1
    }
    public override func afterEach(): Unit {
        if (let Some(s) <- server) {
            s.close()
        }
        if (let Some(ss) <- serverSocket) {
            ss.close()
        }
    }
    func startServerHandshake(config: KeylessTlsServerConfig): Unit {
        var ss = TcpServerSocket(bindAt: port)
        ss.bind()
        let stream: TcpSocket = ss.accept()
        let s = TlsSocket.server(stream, serverConfig: config, session: None)
        
        s.handshake()
        let buffer = Array<Byte>(100, repeat: 0)
        s.read(buffer)
        println("-----Got--------\n ${String.fromUtf8(buffer)} \n---------------------")
        serverSocket = ss
    }

    func serverWrapper(config: KeylessTlsServerConfig) {
        return spawn { 
            try {
                startServerHandshake(config)
            } catch (e: TlsException) {
                return e.message
            }
            return ""
        }
    }

    func clientWrapper(startClientHandshake: () -> Unit) {
        return spawn {
            try {
                startClientHandshake()
            } catch (e: TlsException) {
                return e.message
            }
            return ""
        }
    }

    @TestCase
    func test_keyless_normal(): Unit {
        func startClientHandshake(): Unit {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless rsa client".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }
        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }

    @TestCase
    func test_tls1_2_ecdhe_rsa_aes256_gcm_sha384(): Unit {
        func startClientHandshake() {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            config.supportedCipherSuites[V1_2] = ["ECDHE-RSA-AES256-GCM-SHA384"]
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless rsa client with ECDHE-RSA-AES256-GCM-SHA384".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }
        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }

    @TestCase
    func test_tls1_2_ecdhe_rsa_aes128_gcm_sha256(): Unit {
        func startClientHandshake(): Unit {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            config.supportedCipherSuites[V1_2] = ["ECDHE-RSA-AES128-GCM-SHA256"]
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless rsa client with ECDHE-RSA-AES128-GCM-SHA256".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }

        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }

    @TestCase
    func test_tls1_2_ecdhe_rsa_chacha20_poly1305(): Unit {
        func startClientHandshake(): Unit {
            var config = TlsClientConfig()
            config.verifyMode = CertificateVerifyMode.CustomCA(certificate.map({ c => c }))
            config.supportedCipherSuites[V1_2] = ["ECDHE-RSA-CHACHA20-POLY1305"]
            let clientSocket = TcpSocket("127.0.0.1", port)
            clientSocket.connect()
            let tlsClient = TlsSocket.client(clientSocket, session: None, clientConfig: config)
            tlsClient.handshake()
            tlsClient.write("Hello from keyless rsa client with ECDHE-RSA-CHACHA20-POLY1305".toArray())
            sleep(Duration.second)
            tlsClient.close()
            clientSocket.close()
        }
        let signFunc: KeylessSignCallback = mocksign
        let decryptFunc: KeylessDecryptCallback = mockDecrypt
        let config = KeylessTlsServerConfig(certificate, signFunc, keylessDecryptCallback: decryptFunc)
        let f = serverWrapper(config)
        sleep(Duration.millisecond * 100)
        clientWrapper(startClientHandshake)
        sleep(Duration.millisecond * 100)
        @Expect(f.get(), "")
    }
}

func readTextFromFile(path: String): String {
    var str = ""
    try (file = File(path, Read)) {
        str = String.fromUtf8(readToEnd(file))
    }
    str
}
