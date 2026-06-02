/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a04_{{num}}

  @Assertion:    13.1.3.2(4)  * CPointer<T1> is allowed to cast to CPointer<T2>
                 in unsafe context.

  @Description:  Type 'CPointer<{{Src}}>' can be casted to 'CPointer<{{Dst}}>'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

from utils import utils.assert.Assert

foreign func func_01(): CPointer<{{Src}}>
foreign func func_02(x: CPointer<{{Dst}}>): Bool

main() {
    var Ptr : CPointer<{{Src}}> = unsafe{ func_01() }
    Assert.isFalse(Ptr.isNull())
    var Ptr2: CPointer<{{Dst}}> = CPointer<{{Dst}}>(Ptr)
    var Res: Bool = unsafe{ func_02(Ptr2) }
    Assert.isTrue(Res)
{% if Dst != "Unit" %}
    var Val: {{Dst}} = unsafe{ Ptr2.read() }
    Assert.equals({{EVal}}, Val)
{% endif %}
}
