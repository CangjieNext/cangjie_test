// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %n.%suffix
// ASSERT: scan-2 pipline get 1

import std.runtime.*
import std.runtime

main() {
   let a = blackBox<Int64>(1)
   let r = 1 |> blackBox<Int64>
   println("pipline get ${r}")
   let s = 1 |> runtime.blackBox<Int64>
   println("pipline get ${s}")
}
