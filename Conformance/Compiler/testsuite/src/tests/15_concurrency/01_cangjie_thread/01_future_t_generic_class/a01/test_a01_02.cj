/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_01_a01_02

  @Level:         1
  @Assertion:    15.1.1(1) The value of a spawn expression is a Future<T>
                 object, which can be used to get the computation result
                 of the created thread.

  @Description:  Checks that computation result can be retrieved

  @Mode:         run
  @Negative:     no
  @CompileWarning: yes
  @Structure:    single

*/

import utils.assert.Assert

let float16 = 1.012842384e9f16
let str = "Tất cả mọi người sinh ra đều được tự do và bình đẳng về nhân phẩm và quyền lợi. Mọi con người đều được tạo hóa ban cho lý trí và lương tâm và cần phải đối xử với nhau trong tình anh em."
let int16 = 0xf3i16

main(): Int64 {
    let futFloat16 = spawn {
        return float16
    }
    let futStr = spawn {
        return str
    }
    let futDoubleFuture = spawn {
        return spawn {
            return int16
        }
    }
    Assert.equals(float16, futFloat16.get())
    Assert.equals(str, futStr.get())
    Assert.equals(int16, futDoubleFuture.get().get())
    0
}
