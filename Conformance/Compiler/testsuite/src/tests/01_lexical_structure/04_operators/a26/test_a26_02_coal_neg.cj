/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a26_02_coal_neg

  @Level:         1

  @Assertion:    1.4(26) ?? coalescing

  @Description:  Compiler emit error if ? was found instead ??

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment: 

*/




struct Rect {}
main() {
    var r2 : Rect = Rect();
    var sv:Option<Rect> = Option<Rect>.None
    var re = sv ? r2;
}

