/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output 
// RUN-EXEC: %run %run_opt %output %run_args

open class AAA <: Resource {
    public open func close(expunge: Bool): Unit {}
    public open func close(): Unit {}

    public open func isClosed(): Bool {
        return false
    }
}

main(): Int64 {
    var counter = 1
    try (aaa = AAA()) {
        counter -= 1
    }
    counter
}
