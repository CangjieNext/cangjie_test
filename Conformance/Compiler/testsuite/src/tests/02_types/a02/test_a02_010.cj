/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a02_010

  @Level:         1

  @Assertion:    2(2) At the same time, it is a strongly typed language, 
                 i.e. every expression is associated with a type and the type of 
                 expression not only decides its possible values, but also decides that 
                 can be performed on them.

  @Description:  Checks that attempt to assign a expression, calculating a value of type Float32,
                 to a variable of type struct results in a compilation error.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:  

*/

struct TestStruct {
    var field_01: Int64;
    var field_02: Int16;
    init(field_01: Int64, field_02: Int16) {
        this.field_01 = field_01
        this.field_02 = field_02
    };
}

main() {
    let operand_01 = 1.5f32;
    var operand_02 = 100.0f32;
    var expressionResult: TestStruct = operand_01 * operand_02;
    return 0;
}


