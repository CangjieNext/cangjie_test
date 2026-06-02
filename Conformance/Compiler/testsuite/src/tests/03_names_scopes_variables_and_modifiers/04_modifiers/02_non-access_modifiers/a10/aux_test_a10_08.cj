/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  This file defines sealed interface I and sealed class C.

  @Structure:    complex-aux
*/

package aux_test_a10_08

sealed interface I {
    func f() : Int64
}

abstract sealed class C { }
