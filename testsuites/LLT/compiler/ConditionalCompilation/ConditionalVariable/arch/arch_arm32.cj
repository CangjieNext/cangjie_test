// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %n.cj -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f

// ASSERT: scan found cjc_version
// ASSERT: scan targetArch is not arm
// ASSERT: scan not arm and cjc_version >= 0.0.0

@When[arch == "arm" || cjc_version >= "0.0.0"]
var msg1 = "found cjc_version"

@When[arch == "arm"]
var targetArch = "targetArch is arm"
@When[arch != "arm"]
var targetArch = "targetArch is not arm"

@When[arch == "arm" && cjc_version >= "0.0.0"]
var msg2 = "arm and cjc_version >= 0.0.0"
@When[arch != "arm" && cjc_version >= "0.0.0"]
var msg2 = "not arm and cjc_version >= 0.0.0"

main() {
    println(targetArch)
    println(msg1)
    println(msg2)
}
