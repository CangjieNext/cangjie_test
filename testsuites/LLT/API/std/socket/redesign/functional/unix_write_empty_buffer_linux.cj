/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Linux) EXEC: %compiler %cmp_opt -o %output %f
// (Linux) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan EMPTY_WRITE_REJECTED
// ASSERT: scan NORMAL_WRITE_OK
// ASSERT: scan server received 2

import std.net.*
import std.fs.*
import std.time.*
import std.sync.*

let sockPath = "tmp_unix_empty_write_test.sock"

func runUnixServer(ready: AtomicBool) {
    try (ss = UnixServerSocket(bindAt: sockPath)) {
        ss.bind()
        ready.store(true)
        try (c = ss.accept()) {
            let buf = Array<Byte>(8, repeat: 0)
            let n = c.read(buf)
            if (n == 2 && buf[0] == UInt8(104)) {
                println("server received ${n}")
            }
        }
    }
}

main(): Int64 {
    removeIfExists(sockPath)
    let ready = AtomicBool(false)
    let fut = spawn {
        runUnixServer(ready)
    }
    while (!ready.load()) {
        sleep(Duration.millisecond * 10)
    }

    try (socket = UnixSocket(sockPath)) {
        socket.connect()
        // An empty payload must be rejected with IllegalArgumentException,
        // consistent with the read path and the documented contract.
        try {
            socket.write(Array<Byte>())
            println("unexpected: empty write succeeded")
        } catch (e: IllegalArgumentException) {
            if (e.message.contains("Buffer is empty")) {
                println("EMPTY_WRITE_REJECTED")
            }
        }
        socket.write("hi".toArray())
        println("NORMAL_WRITE_OK")
    }
    fut.get()
    removeIfExists(sockPath)
    return 0
}
