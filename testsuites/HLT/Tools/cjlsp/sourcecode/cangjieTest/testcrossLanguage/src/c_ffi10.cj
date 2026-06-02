/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
foreign func testfuncpara1(a: Int64, b: Float64): Float64

func test10():Int64 {
  unsafe { if (testfuncpara1(10, 3.14) < 3.1847133757962 && testfuncpara1(10, 3.14) > 3.1847133757961) {
      return 0
    }
  }
  return 1
}
