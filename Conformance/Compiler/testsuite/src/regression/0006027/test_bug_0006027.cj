/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
 /*
  @Name:        bug_0006027
  @Description: Issue 0006027: The specification does not prohibit duplicate class and interface modifiers
  @Mode:        run
  @Negative:    yes
  @Structure:   single
*/

public public class TestBug0006027 {}

main() {
    var a = A()
}
