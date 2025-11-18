/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common interface I<T> {
    prop p: Int64 { get(){0} }
    func f(a:T): T { a }
}

public common class C {}

common extend C <: I<Int64> {
    public common prop p: Int64 { get(){0} }
    public common func f(a:T): T { a }
}
