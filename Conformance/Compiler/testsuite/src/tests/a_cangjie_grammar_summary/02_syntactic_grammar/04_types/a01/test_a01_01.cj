/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a01_01

  @Level:         1
  @Assertion:   A.2.4(1) 
                type
                    : arrowType
                    | tupleType
                    | prefixType
                    | atomicType
                    ;
  @Description: Check some arrow types
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

main() {
    var v1: (String) -> Rune
    var v2: () -> Bool
    var v3: (Float16, () -> Bool) -> IntNative
    var v4: (Float16, Bool) -> (() -> String)
    return 0
}
