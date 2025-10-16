struct S{
    static const a:Int8 = 127
    static const b:Int8 = 29

    @OverflowWrapping   // Annotation
    // Modifier
    static init(
    ){
        let res: Int8 = a + b  // body
    }
}

main() {
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
