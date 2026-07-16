// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package broken_member

main(): Unit {
    // Keep the source syntactically valid so dependency scanning succeeds,
    // then fail during semantic compilation to exercise generateBuildCmd().
    let value: Int64 = "not an integer"
    println(value)
}
