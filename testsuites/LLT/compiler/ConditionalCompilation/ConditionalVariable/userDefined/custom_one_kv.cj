// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler %cmp_opt %n.cj %conditional_compilation_config_opt="feature=lion" -o %output
// ERRCHECK:%compiler %cmp_opt %n.cj %conditional_compilation_config_opt="feature = false" -o %output
// ASSERT: scan undeclared identifier 'mc'

@When[feature == "lion"]
class mc {}

main(): Int64 {
    var a = mc()
    return 0
}
