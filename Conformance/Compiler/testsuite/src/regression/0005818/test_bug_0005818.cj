/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            bug_0005818
  @Assertion:       Using Nothing as a type variable in generic functions

  @Description:     There is a compilation error "expected 'Enum-Option<Nothing>', found 'Enum-Option<Nothing>'" which
                    shouldn't be there.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Comment:         CompilerBug, fixed in v0.37.2
*/

func f<T>(a: Option<T>) {}

main() {
    f(Option<Nothing>.None)
}
