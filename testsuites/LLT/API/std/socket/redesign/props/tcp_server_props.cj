/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

internal import std.net.*
internal import std.time.*

@When[os != "Windows"]
var isWindows = false
@When[os == "Windows"]
var isWindows = true

main(): Int64 {
    let serverPort: UInt16 = 23788

    try (serverSocket = TcpServerSocket(bindAt: serverPort)) {
        // reuseAddress
        serverSocket.reuseAddress = true
        if (serverSocket.reuseAddress == false) {
            return 2
        }
        serverSocket.reuseAddress = false
        if (serverSocket.reuseAddress == true) {
            return 3
        }

        // reusePort
        if (!isWindows) {
            serverSocket.reusePort = true
            if (serverSocket.reusePort == false) {
                return 4
            }
            serverSocket.reusePort = false
            if (serverSocket.reusePort == true) {
                return 5
            }
        }

        // local address
        let la = serverSocket.localAddress
        if (la.toString() != "0.0.0.0:${serverPort}") {
            return 6
        }

        if (serverSocket.sendBufferSize <= 0) {
            return 9
        }
        serverSocket.sendBufferSize = 4000 // just ok, hard to verify, because of OS "math"

        if (serverSocket.receiveBufferSize <= 0) {
            return 10
        }
        serverSocket.receiveBufferSize = 4000

        if (let Some(nint) <- serverSocket.bindToDevice) {
            return 11
        }
        serverSocket.bindToDevice = "???" // doesn't apply because of no 'bind' 

        serverSocket.backlogSize = 11
        if (serverSocket.backlogSize != 11) {
            return 12
        }

        return 0
    }

    return 100
}
