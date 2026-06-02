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
import std.runtime.*
import std.posix.*

@When[os == "Windows"]
foreign func _unlink(filename: CPointer<Byte>): Int32

@When[os == "Windows"]
func unlink(filename: String): Int32 {
    unsafe {
        let cph = acquireArrayRawData(filename.rawData())
        let ret = _unlink(cph.pointer)
        releaseArrayRawData(cph)
        return ret
    }
}

func startSockets() {
    var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
    udpsocket.bind()
    var tcpsocket = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
    tcpsocket.bind()

    unlink("whatever1") //unavailable on windows
    var unixsocket = UnixDatagramSocket(bindAt: "whatever1")
    unixsocket.bind()
}

main() {
    startSockets()
    GC(heavy: true)
    sleep(Duration.millisecond * 500)
    GC(heavy: true)
    sleep(Duration.millisecond * 500)
}
