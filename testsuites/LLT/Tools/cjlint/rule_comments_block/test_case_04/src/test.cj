// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func sub(x: Int64): Int64 {
    return x
}

/* cjlint-ignore   -start   !G.FUN.02*/
func logInfo2(fileName: String, lineNo: Int64, fileName2: String, lineNo2: Int64): Unit {
    let c = fileName
    let b = sub(lineNo)
}
/* cjlint-ignore   -end*/