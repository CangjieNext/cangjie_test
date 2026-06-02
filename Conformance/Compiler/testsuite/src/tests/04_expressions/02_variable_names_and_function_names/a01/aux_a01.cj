/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  Aux file with functions in the package
  @Structure:    complex-aux
*/

package a01

import utils.assert.Assert

public func empty() {}

public func with_params(i: Int64, j: Int32, name: String) {}

public func with_return(): Int64 {
    Assert.getRuntimeZero()
}

public func generic<T>(): Int64 {
    1
}

public func complex<T1, T2, T3>(a: T1, b: T2, c: T3): T3 {
    c
}
