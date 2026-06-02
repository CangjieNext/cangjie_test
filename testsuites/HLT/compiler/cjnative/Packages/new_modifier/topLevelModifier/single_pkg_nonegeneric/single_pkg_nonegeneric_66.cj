/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

protected class T_a {
    public static let b: Int64 = 1
}

public func test(): Int64 {
    var a = T_a.b
    return a
}

main() {
    return test() - 1
}
