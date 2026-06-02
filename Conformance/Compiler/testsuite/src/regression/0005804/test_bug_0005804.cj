/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         bug_0005804

  @Description:  Internal Compiler Error: the Position is empty!

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      TODO harness must not mark as passed if "Internal Compiler Error"
*/

struct S {
    static let x: Int32 = 100
    var y: () -> Int32 = { => x }
    S(var str!: String = "ok", var y) { }
}

main() {
    let s = S()
    println(s.y())
}
