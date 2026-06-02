/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

/*
 * Test description: Test sendBufferSize and receiveBufferSize with
 * different inputs in tcp server or socket
 * Test API: public mut prop sendBufferSize: Int64
 *           public mut prop receiveBufferSize: Int64
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

main() {
    let unixSocket: UnixSocket = UnixSocket("/tmp/sock123")

    try {
        unixSocket.sendBufferSize = -100
    } catch (e: IllegalArgumentException) {
        assertEqual("Expected:", "Actual:", "Buffer size should be positive, got -100.", e.message)
    }

    try {
        unixSocket.receiveBufferSize = -100
    } catch (e: IllegalArgumentException) {
        assertEqual("Expected:", "Actual:", "Buffer size should be positive, got -100.", e.message)
    }
}
