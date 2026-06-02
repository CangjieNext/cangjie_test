/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

/*
 * Test description:
 *           To test the equatable function of the SocketNet enumeration class.
 * Test API:
 *           public operator func == (that: SocketNet) : Bool
 *           public operator func != (that: SocketNet) : Bool
 */

internal import std.net.*

main() {
    let socketNet1 = SocketNet.TCP
    let socketNet2 = SocketNet.UDP
    let socketNet3 = SocketNet.TCP
    let socketNet4 = SocketNet.UDP
    if (socketNet1 == socketNet3 && socketNet2 == socketNet4 && socketNet1 != socketNet2) {
        return 0
    } else {
        return -1;
    }
    return 0
}
