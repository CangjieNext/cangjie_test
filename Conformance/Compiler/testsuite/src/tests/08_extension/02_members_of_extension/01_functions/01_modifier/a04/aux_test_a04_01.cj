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


package p1

public class AuxTestA0401 {}

extend AuxTestA0401 {
    func foo(): Int64 { 7 }
}

public func f1(a: AuxTestA0401): Int64 {
    a.foo() - 1
}
