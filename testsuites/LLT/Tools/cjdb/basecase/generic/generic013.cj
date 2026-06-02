// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo<T>(para: T) {
    var aaa: T = para
    let bbb: T = para
    aaa
}

main() {
    var abc: VArray<Int64, $3> = [1, 2, 3]
    var aa = foo(abc)
    aa[0]
    0
}
