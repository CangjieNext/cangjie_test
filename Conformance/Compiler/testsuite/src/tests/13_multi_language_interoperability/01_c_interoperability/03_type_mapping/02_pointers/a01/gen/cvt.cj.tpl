/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a01_{{num}}

  @Assertion:    13.1.3.2(1)  Cangjie provides CPointer<T> type to represent T*
                 type in C language, while T must conform to CType constraint. 

  @Description:  Cangjie type 'CPointer<{{CJType}}>' is mapped to C type '{{CType}} *'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

from utils import utils.assert.Assert

foreign func func_01(): CPointer<{{CJType}}>
foreign func func_02(x: CPointer<{{CJType}}>): Bool

main() {
    var Ptr : CPointer<{{CJType}}> = unsafe{ func_01() }
    var Checked : Bool = unsafe{ func_02(Ptr) }
    Assert.isTrue(Checked)
{% if CJType != "Unit" %}
    var Val : {{CJType}} = unsafe{ Ptr.read() }
    Assert.equals({{CJVal}}, Val)
    unsafe{ Ptr.write({{CJVal2}}) }
    Val = unsafe{ Ptr.read() }
    Assert.equals({{CJVal2}}, Val)
{% endif %}
}
