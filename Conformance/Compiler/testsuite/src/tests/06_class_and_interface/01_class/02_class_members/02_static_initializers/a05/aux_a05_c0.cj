/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description: The definition of class with a static initializer
  @Structure: complex-aux
  @Dependencies: aux_a05_c00.cj aux_a05_c01.cj
*/

class C0 {
    static let t : Duration

    static init() { t = getTime() }
}

var assertC00 = Assert.isTrue(C00.t < C0.t)
var assertC01 = Assert.isTrue(C01.t < C0.t)
