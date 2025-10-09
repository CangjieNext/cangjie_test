// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %n.cj -o %output
// ASSERT: scan builtin condition 'os' do not support 'Linuxs', supported listed: 'Windows Linux macOS iOS HarmonyOS'
// ASSERT: scan builtin condition 'backend' do not support 'cjnativegc', supported listed: 'cjnative'

package b

@When[os == "Linuxs"]
class mc {}

@When[backend == "cjnativegc"]
class mc {}

main(): Int64 {
    var a = mc()
    return 0
}
