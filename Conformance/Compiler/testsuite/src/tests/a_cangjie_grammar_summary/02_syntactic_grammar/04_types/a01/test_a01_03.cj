/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a01_03

  @Level:         1
  @Assertion:   A.2.4(1) 
                type
                    : arrowType
                    | tupleType
                    | prefixType
                    | atomicType
                    ;
  @Description: Check prefix type
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
import utils.assert.Assert

class C1{ }

main() {
    var v1: ?C1
    var v2: ?Int16
    var v3: ?UInt32
    var v4: ?Float16
    var v5: ?Rune
    var v6: ?String
    var v7: ?Bool
    var v8: ?Unit
    return 0
}
