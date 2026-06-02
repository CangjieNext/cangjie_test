/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public func testIterableCollectString<T>(itT1: Iterable<T>, splitString: String, collectStringExpect: String): Int64 where T <: Comparable<T> & ToString {
    var collectStringFunc = collectString<T>(delimiter: splitString)
    var collectStringActual = collectStringFunc(itT1)
    if (collectStringActual != collectStringExpect) {
        return 1
    }
    return 0
}
