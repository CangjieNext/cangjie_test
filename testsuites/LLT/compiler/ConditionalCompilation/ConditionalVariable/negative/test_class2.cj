// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %n.cj -o %output
// ASSERT: scan cjc version's format should be 'xx.xx.xx'

package b

@When[cjc_version >= "0.17.228"]
class mc {}

main(): Int64 {
    var a = mc()
    return 0
}
