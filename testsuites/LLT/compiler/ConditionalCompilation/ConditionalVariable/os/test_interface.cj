// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %cmp_opt %n.cj -o %output
// EXEC:%run %run_opt %output %run_args

package b

@When[os == "Linux"]
interface mi {}

@When[os == "macOS"]
interface mi {}

@When[os == "Windows"]
interface mi {}

class mc <: mi {}

main(): Int64 {
    var a = mc()
    return 0
}
