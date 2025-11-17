/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f

import std.{fs.*, net.*}
import stdx.net.tls.*
import stdx.crypto.x509.*

main() {
    var config = TlsClientConfig()
    config.verifyMode = TrustAll
    config.alpnProtocolsList = ["h2"]

    // 用于恢复会话
    var lastSession: ?TlsSession = None

    while (true) { // 重新连接环路
        try (socket = TcpSocket("127.0.0.1", 8443)) {
            socket.connect() // 首先进行 TCP 连接
            try (tls = TlsSocket.client(socket, clientConfig: config, session: lastSession)) {
                try {
                    tls.handshake()  // then we are negotiating TLS
                    lastSession = tls.session // 如果成功协商下一次重新连接，将记住会话
                } catch (e: Exception) {
                    lastSession = None // 如果协商失败，将删除会话
                    throw e
                }

                // tls实例已完成
                tls.write("Hello, peer! Let's discuss our personal secrets.\n".toArray())
            }
        } catch (e: Exception) {
            println("client connection failed ${e}, retrying...")
        }
    }
}
