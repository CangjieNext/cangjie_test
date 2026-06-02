
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a10_02

  @Level:         1

  @Assertion:   16.2(10) 8.if, match, try, control transfer expressions (including return, break, continue, throw),
                is, as. 
  @Description: Check that if, match, try, control transfer expressions (including return, break, continue, throw),
                is, as expressions are const expressions.
  @Mode: CompileOnly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore
  @Issue: 6614

*/

import utils.assert.Assert

main() {
    const d = throw Exception("")
    0
}
