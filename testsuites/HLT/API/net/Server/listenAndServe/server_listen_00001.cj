/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.net.*
import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit

@Test
class Test_server_listen_00001 {
    @TestCase
    func test_address_in_use() {
        let server1 = ServerBuilder().addr("127.0.0.1").port(0).build()
        server1
            .distributor
            .register(
                "/hello1",
                {
                    ctx =>
                    ctx.responseBuilder.header("a", "a")
                    ctx.responseBuilder.header("b", "b")
                }
            )
        spawn {server1.serve()}
        while (server1.port == 0) {
            sleep(Duration.millisecond)
        }

        let server2 = ServerBuilder().addr("127.0.0.1").port(server1.port).build()
        let e = @AssertThrows[SocketException](server2.serve())
        @Expect(e.message.contains("Address already in use") || e.message.contains("Address in use"))
        server1.close()
        server2.close()
    }
}
