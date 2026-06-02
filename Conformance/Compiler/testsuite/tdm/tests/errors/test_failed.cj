/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  Test for demonstration, it's failed since
                 according to SPEC main cannot have Bool return type.

  @Mode:         run
  @Negative:     no
  @Structure:    single
*/


main(): Bool {
    return true
}
