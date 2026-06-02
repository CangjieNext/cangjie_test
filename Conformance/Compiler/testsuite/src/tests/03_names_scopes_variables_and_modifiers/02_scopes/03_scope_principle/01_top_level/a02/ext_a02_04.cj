/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  Define second part of inheritance cycle
  @Structure:    complex-aux
*/
package somepackage4

interface Inter2 <: Inter1 {
    func getInt2(): Int64
}