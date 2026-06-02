/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_01_a04_02

  @Level:         1
  @Assertion:    3.3.2.1(4) Immutable variables can be assigned only once for initialization.
                 If an immutable variable is assigned multiple times, a compilation error is reported.

  @Description:  Checks that only initialized immutable variable can be used
                 (Duplication of test03_03_02_01_a01_01 and test03_03_02_01_a03_01)

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import utils.assert.Assert

let STR_CONST: String = "\n\n\n新华通讯社主办公司官网股票代码：603888\n\n学习进行时高层时政人事国际财经网评港澳台湾思客智库全球连线教育科技科普体育文化健康军事访谈视频图片中央文件\n金融汽车食品房产信息化乡村振兴溯源中国城市旅游能源会展彩票娱乐时尚悦读公益书画一带一路亚太网上市公司投教基地\n\n\n";

main() {
    // useless test #1
    let a: Int32 = 1_000_000
    Assert.equals(1_000_000, a, reason: "Int value must match")

    // useless test #2
    var b: Bool = true
    Assert.isTrue(b, reason: "Bool value must match")

    // useless test #3
    var f: Float16 = 0.1234567890
    Assert.equals(0.123456789, f, reason: "Float16 value must match")

    // useless test #4
    var s: String = STR_CONST
    Assert.equals(STR_CONST, s, reason: "String value must match")

    // useless test #5
    var a1: Int64 = 16_465_890_123
    Assert.equals(16_465_890_123, a1, reason: "Int value must match")
}
