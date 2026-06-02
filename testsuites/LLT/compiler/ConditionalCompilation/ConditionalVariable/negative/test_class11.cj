// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %n.cj %conditional_compilation_config_opt="a=tiger" -o %output
// ASSERT: scan expected expression after '[', found '=='
// ASSERT: scan expected expression after '==', found ']'

package b

@When[=="tiger"]
class mc{}

@When[a==]  
class mc{}

main(): Int64 {
    var a = mc()
    return 0
}
