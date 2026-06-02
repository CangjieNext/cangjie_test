// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE:%compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// Test Nothing as generic instantiation type.
// Future<Nothing> and Future<Unit>
main(): Int64 {
    let f = spawn {
        throw Exception("Expected Exception in thread")
    }

    println("spawn has created Future<Unit> ? ${f is Future<Unit>}")
    0
}
