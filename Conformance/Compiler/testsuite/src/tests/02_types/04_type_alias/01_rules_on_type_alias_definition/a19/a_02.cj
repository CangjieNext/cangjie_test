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

// a.cj
package a_02
class ClassWithLongNameB {

}

/* error: classB can not be declared with modifier 'public', as 'ClassWithLongNameB' is internal */
public type classB = ClassWithLongNameB
