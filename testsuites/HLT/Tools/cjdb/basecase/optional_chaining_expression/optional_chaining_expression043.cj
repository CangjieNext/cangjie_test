/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func func4(para:(Int64)->Int64) {
    para(5)
}

main() {
    var f1 = Some(func4)
    var r1 = f1?({i=>i+1})
    0
}
