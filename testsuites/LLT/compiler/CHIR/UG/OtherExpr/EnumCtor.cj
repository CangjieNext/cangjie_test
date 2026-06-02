// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %disInst %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args

enum HHH<T> {
    A(T) | B(Int8, Int8)
}

main() {
    var h1 = HHH<Int64>.A(200)
    return 0
}
