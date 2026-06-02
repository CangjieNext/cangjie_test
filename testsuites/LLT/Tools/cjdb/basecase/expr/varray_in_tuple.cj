// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Int64 {
    var aaa = VArray<Int64, $3>({i => i})
    var bbb = (true, 18, 13.132, 'a', "hello", r'\u{78}', [1, 2, 3])
    var ccc = (bbb, aaa)
    return 0
}
