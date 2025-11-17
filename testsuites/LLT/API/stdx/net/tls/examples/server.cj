/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f

import std.{fs.*, net.*, io.*}
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*

let certificatePath = "./files/apiserver.crt"
let certificateKeyPath = "./files/apiserver.pem"

main() {
    // 对证书以及私钥进行解析
    let pem = readTextFromFile(certificatePath)
    let keyText = readTextFromFile(certificateKeyPath)

    let certificate = X509Certificate.decodeFromPem(pem)
    let privateKey = PrivateKey.decodeFromPem(keyText)

    let config = TlsServerConfig(certificate, privateKey)

    //可选：允许恢复TLS会话
    let sessions= TlsSessionContext.fromName("my-server")

    try (server = TcpServerSocket(bindAt: 8443)) {
        server.bind()

        server.acceptLoop {
            clientSocket => try (tls = TlsSocket.server(clientSocket, serverConfig: config, sessionContext: sessions)) {
                tls.handshake()
                let buffer = Array<Byte>(100, repeat: 0)
                tls.read(buffer)
                println(buffer) // operate received data.
            }
        }
    }
}

// 简化示例代码的辅助函数
extend TcpServerSocket {
    func acceptLoop(handler: (TcpSocket) -> Unit) {
        while (true) {
            let client = accept()
            spawn {
                try {
                    handler(client)
                } finally {
                    client.close()
                }
            }
        }
    }
}

func readTextFromFile(path: String): String {
    var str = ""
    try (file = File(path, Read)) {
        str = String.fromUtf8(readToEnd(file))
    }
    str
}
