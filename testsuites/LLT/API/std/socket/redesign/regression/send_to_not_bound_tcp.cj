/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

main() {
    var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
    var addr = udpsocket.localAddress
    var data = Array<Byte>(1, repeat: 1)
    var wasThrown = false

    try {
        udpsocket.sendTo(addr, data)
    } catch (e: SocketException) {
        wasThrown = true
    }

    assertEqual("Expected:", "Actual:", true, wasThrown)

    udpsocket.close()
}
