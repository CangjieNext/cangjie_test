/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Structure:       complex-aux
*/
package test

let vf32_21: Float32 = Init.initFloat32("B1")
let vf32_22: Float32 = Init.initFloat32("B2")
let vf32_23: Float32 = Init.initFloat32("B3") + foo4() + foo1()

func foo2(): Float32 {
    2.2
}
