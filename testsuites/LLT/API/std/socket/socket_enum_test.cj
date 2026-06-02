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
 *       Test enum SocketNet and enum SocketAddressKind and
 *       public enum SocketKeepAliveConfig
 * Test API:
 *       public init()
 *       public init(message: String)
 *       protected open override func getClassName(): String
 */

internal import std.net.*
internal import std.time.*

main(): Int64 {
    var socktKeepAliveConfig = Option<SocketKeepAliveConfig>.None
    var socktKeepAliveConfig1 = SocketKeepAliveConfig(
        idle: Duration.second,
        interval: Duration.second,
        count: 1
    )
    return 0
}
