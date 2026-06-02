/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Composition

interface MyInter {}
class A1 <: MyInter {}

var res_1 = hh_1<A1> ~> hh_2<MyInter>
var res_3 = hh_1<MyInter> ~> hh_2<MyInter>
