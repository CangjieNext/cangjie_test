/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var legal_ipv4: Array<IPSocketAddress> = [
    IPSocketAddress(IPv4Address.localhost, 0),
    IPSocketAddress(IPv4Address.unspecified, 0)
]

main() {
    var sum = 0
    for (address in legal_ipv4) {
        var serversocket = TcpServerSocket(bindAt: address)
        serversocket.reuseAddress = false
        serversocket.bind()
        var serversocket00 = TcpServerSocket(
            bindAt: IPSocketAddress(address.address, (serversocket.localAddress as IPSocketAddress)?.port ?? 0))
        try {
            serversocket00.bind()
        } catch (e: SocketException) {
            sum += 1
        }
        serversocket.close()
    }
    @Assert(sum, 2)
}
