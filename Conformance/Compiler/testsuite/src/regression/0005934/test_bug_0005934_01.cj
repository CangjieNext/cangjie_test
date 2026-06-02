/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      bug_0005934_01

  @Assertion: Issue 0005934: Compiler emit-fake error about non-initialization 
              although it was twice

  @Negative:  no

  @Structure: single

*/

struct Rect {
    var wid: Int32 = 10
    var len: Int32 = 20
}

main() {
    var sv : Rect;
    sv.wid = sv.wid+0
    sv.len = sv.len+1
    return 0;
}

