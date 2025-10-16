/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %n.%suffix %run_utest_opt %run_args

import std.net.*
import stdx.net.tls.*
import stdx.net.tls.common.*

class myTlsKit <: TlsKit {
    let defaultTlsKit = DefaultTlsKit()
    public func getTlsServer(socket: StreamingSocket, config: TlsConfig, session!: ?TlsSession): TlsConnection {
        defaultTlsKit.getTlsServer(socket, config, session: session)
    }
    public func getTlsClient(socket: StreamingSocket, config: TlsConfig, session!: ?TlsSession): TlsConnection {
        defaultTlsKit.getTlsClient(socket, config, session: session)
    }
    public func getTlsServerSession(name: String): TlsSession {
        defaultTlsKit.getTlsServerSession("")
    }
}

@Test
class Test_GetGlobalTlsKit_02 {
    @TestCase
    func test_01(): Unit {
        setGlobalTlsKit(myTlsKit())
        @Assert(getGlobalTlsKit() is myTlsKit)
    }
}
