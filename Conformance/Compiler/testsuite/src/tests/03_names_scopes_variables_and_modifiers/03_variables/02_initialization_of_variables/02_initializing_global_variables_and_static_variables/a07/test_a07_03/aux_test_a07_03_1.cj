/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Structure:    complex-aux
*/

var v11F32: Float32 = InitCommon.initFloat32("A1")
var v12F32: Float32 = InitCommon.initFloat32("A2") + C3.staticVar
var v13F32: Float32 = InitCommon.initFloat32("A3")

class C1 {
    static let staticVar: Float32 = 1.1
}

struct S1 {
    static let staticVar: Float32 = 1.1
}
