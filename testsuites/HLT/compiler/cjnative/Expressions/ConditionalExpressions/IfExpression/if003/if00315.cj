/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
class Point {
    public var x: Int32 = 0
    public var y: Int32 = 0
    public func test() {
        if (true) {
            this.x = 1
            this.y = 2
        }
    }
}

main(): Int64 {
    return 0
}
