/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan function 'SetGCThreshold' is deprecated. Use 'public func setGCThreshold(value: UInt64): Unit' instead.

import std.runtime.*

main() {
    SetGCThreshold(2.33)
}
