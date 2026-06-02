/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan extra characters at the end of the address

/*
 * Test description: To verify the initialization () function of the socketAddress class.
 * Test API: public init(kind: SocketAddressKind, address: Array<UInt8>, port: UInt16)
 */

internal import std.net.*

main(): Int64 {
    try {
        var sa = IPSocketAddress("0:0:0:0:0:0:ffff::192.108.1.1.1", 8899)
    } catch (e: Exception) {
        println(e.message)
    }

    return 0
}
