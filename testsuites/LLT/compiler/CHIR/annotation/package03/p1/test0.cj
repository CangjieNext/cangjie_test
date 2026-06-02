// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test0

@Annotation
public class MyAnn4 {
    let rune: Rune
    let write_line: (String) -> Unit
    public const init(r: Rune, w_l: (String) -> Unit) {
        this.rune = r
        this.write_line = w_l
    }
}
