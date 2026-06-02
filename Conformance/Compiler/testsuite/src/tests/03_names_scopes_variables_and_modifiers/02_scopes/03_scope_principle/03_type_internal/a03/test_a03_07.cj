/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_03_a03_07

  @Level:         1

  @Assertion:    3.2.3.3(3) The scope of the enum constructor names is in the entire enum definition.
                  More detailed description of enum constructors are in enum Type.

  @Description:  Check that generic enum static functions cannot be accessible outside the enum definition.
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

enum MathSign<T1> {
    | add(T1)

    static func printVal(p: MathSign<T1>) {
        match(p) {
            case add(T1) => print("add")
        }
    }
}

main() {
    printVal(add(1)) // compilation error: undeclared identifier 'printVal'
}