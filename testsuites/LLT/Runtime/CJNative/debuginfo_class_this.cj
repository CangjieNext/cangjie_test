// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %cmp_opt -g %n.cj 2>&1 | compare %f
// ASSERT: regex !(?P<sp>\d+) = distinct !DISubprogram\(name: "init", linkageName: "_CN7default2C16<init>Hv"
// ASSERT: regex !DILocalVariable\(name: "this", arg: 1, scope: !(?P=sp)

class C1 {
    protected let pro: Int64 = 5
    public static let sta: Int64 = 3
    public let name: String = "afdoaidfad"
    protected static let sta_pro: Int64 = 10
    init() {}
}

main() {
    let newc2 = C1()
    return 1
}
