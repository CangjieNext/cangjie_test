// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %n.cj %conditional_compilation_config_opt="a=lion," -o %output
// ASSERT: regex error.*: user defined condition should be like: k1=v1,k2=v2

package b

@When[a == "lion"]
class mc {}

main(): Int64 {
    var a = mc()
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
