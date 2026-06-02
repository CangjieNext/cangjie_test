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

public open class BB<T> {
    private var a = 0

    static init() {
    }
}

protected class AA <: BB<Int64> {
    var a = BB<Int64>()
}

main() {
    var a = AA()
    return 0
}
