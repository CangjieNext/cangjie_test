//  Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information. 
 
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

// here it is important to have Range type
public common func faf(fafParam!: Range<Int> = 1..2) { fafParam }
public common func fbf(fbfParam!: Range<Int>) { fbfParam }

public func fcf() {
    func f(p!: Int = 9) { p }

    CAC<Int8>.fmf()
    f()
}

common func fxf(fafParam!: Range<Int> = 1..2) { fafParam }
common func fyf(fbfParam!: Range<Int>) { fbfParam }

common class CAC<T> {
    init() {}
    common static func fmf(fmfParam!: Range<Int> = 1..2) { fmfParam }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %diag_json --experimental --common-part-cjo=c/cmp.cjo c/cmp.chir p/p.cj --output-type=dylib
package cmp
 
public specific func faf(fafParam!: Range<Int>) { fafParam }
public specific func fbf(fbfParam!: Range<Int> = 2..4) { fbfParam }

specific func fxf(fafParam!: Range<Int>) { fafParam }
specific func fyf(fbfParam!: Range<Int> = 2..4) { fbfParam }

specific class CAC<T> {
    specific static func fmf(fmfParam!: Range<Int>) { fmfParam }
}

public func use() {
    faf()
    fbf()
    fcf()
    fxf()
    fyf()

    CAC<Int>.fmf()
}
