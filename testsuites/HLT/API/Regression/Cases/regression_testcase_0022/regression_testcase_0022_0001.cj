/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
package C

import std.ast.*
import B.*

public macro c1(x:Tokens,y:Tokens){
  {  var resinin = @b1[0](1)
    let list0 = [1, 2, 3, 3, 2, 1]
    res **= 1
    res *= 2.3
    res /= true
    quote($res)
/}

public macro c2(x:Tokens,y:Tokens){
    let list0 = [1, 2, 3, 3, 2, 1]
     var res = @b2[0](1)
    res **= 1
    res *= 2.3
    res /= true
    quote($res)
 in}
    let list0 = [1, 2, 3, 3, 2, 1]
    let list0 = [1, 2, 3, 3, 2, 1]
in