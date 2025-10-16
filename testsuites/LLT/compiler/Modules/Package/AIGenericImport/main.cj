// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: nn, ops
// EXEC: %compiler %compile_lib_opt -p ops --module-name ops -o ops/ops.%middle
// EXEC: %compiler %compile_lib_opt -p nn --module-name nn -o nn/nn.%middle
// EXEC: %compiler ops/ops.%middle nn/nn.%middle %f -o %output
// EXEC: %run %run_opt %output

internal import ops.*
internal import nn.*

func test() {
    let opt = Opt<Int64>(1)
}

main(): Int64 {
    test()
    0
}
