// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
public open class O1{}
public open class O2{}
public common enum RGBColor<T> where T<:O1 {
    RED(T) | GREEN(T) | BLUE(T)
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp

public specific enum RGBColor<T>where T<:O2 {
    RED(T) | GREEN(T) | BLUE(T)
}

// ASSERT: scan error: the constraint of type parameter is not looser than parent's constraint
