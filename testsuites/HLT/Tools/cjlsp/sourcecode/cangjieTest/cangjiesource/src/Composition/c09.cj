/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Composition

let lambdaCom1 = ({x: Int32 => x}) ~> f_1
let lambdaCom2 = f_1 ~> ({x: Float32 => x})
let lambdaCom3 = ({x: Int32 => x}) ~> ({x: Int32 => x})
