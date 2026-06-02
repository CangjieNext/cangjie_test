/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.regex.*

public func test(str: String): Bool {
    let regexString: String = "(Mon?|Tue?|Wed?|Thu(r)?|Fri?|Sat?|Sun?)\\,\\s([0123][0-9]|0?[1-9]){1}\\s(Jan?|Feb?|Mar?|Apr?|May?|Jun?|Jul?|Aug?|Sep(t)?|Oct?|Nov?|Dec)\\s(\\d{4})\\s([0-1]?[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])"
    let regex1: Regex = Regex(regexString)
    let matchresult1: Int64 = regex1.matcher(str).findAll().getOrThrow().size
    return matchresult1 > 0
}
