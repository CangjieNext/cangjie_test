/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
//调用标准库函数
import stdx.encoding.base64.*

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

func f24(){
    println()
    print(true)
    var str = "TWFu"
    var opt1 = fromBase64String("TWFu")
    var opt2 = fromBase64String(str)
    var res1 = matchResult<Array<UInt8>>(opt1, Array<UInt8>())
    var res2 = matchResult<Array<UInt8>>(opt2, Array<UInt8>())
}
