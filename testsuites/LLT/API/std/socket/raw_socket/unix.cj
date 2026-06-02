/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Unix) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt
// (Unix) EXEC: rm -rf ./uds_socket_temp

import std.net.*

@Test
class UDS_socket {
    @TestCase
    func Unix_communication(): Unit {
        let server = RawSocket(SocketDomain.UNIX, SocketType.STREAM, ProtocolType.Unspecified)
        let client = RawSocket(SocketDomain.UNIX, SocketType.STREAM, ProtocolType.Unspecified)
        let array = Array<Byte>(110, repeat: 0)
        array[0..2] = [1, 0] // AF_UNIX
        let addr: Array<Byte> = "./uds_socket_temp".toArray()
        array[2..(2 + addr.size)] = addr
        let s_addr = RawAddress(array)
        server.bind(s_addr)
        server.listen(10)
        spawn {
            client.connect(s_addr)
            let msg_send: Array<Byte> = "Hello, cangjie server.".toArray()
            client.send(msg_send, 0)
            client.close()
        }
        let msg_arr = Array<Byte>(100, repeat: 0)
        let srv_com = server.accept()
        let msg_size = srv_com.receive(msg_arr, 0)
        let msg_recv = String.fromUtf8(msg_arr.slice(0, msg_size))
        server.close()
        @Expect(msg_recv, "Hello, cangjie server.")
    }
}
