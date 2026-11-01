/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package state_side

public var ready: Int64 = 0

func boot(): Int64 {
    ready = 7
    7
}

public let _boot: Int64 = boot()

public func readReady(): Int64 {
    ready
}
