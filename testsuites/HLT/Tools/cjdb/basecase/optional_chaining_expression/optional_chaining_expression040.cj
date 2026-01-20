/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct S1{
    var a = 1
}

class C1{
    func func4(para:(S1)->S1) {
        para(S1())
    }
}

main() {
    var f1 = Some(C1().func4)
    var r1 = f1?({i:S1=>S1()})
    0
}
