// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %n.cj -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f

// (arm)ASSERT: scan aarch64
// (x86)ASSERT: scan x86_64

@When[arch == "x86_64"]
var targetArch = "x86_64"
@When[arch == "aarch64"]
var targetArch = "aarch64"

main() {
    println(targetArch)
}
