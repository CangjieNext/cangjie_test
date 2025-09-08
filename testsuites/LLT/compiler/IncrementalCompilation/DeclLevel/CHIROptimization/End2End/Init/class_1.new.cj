public class C{
    public var a = 1
    public let b = 1
    public static const c = 1
}

main() {
    if (C().a == 0 && C().b == 0 && C.c == 0) {
        return 0
    } else if (C().a == 1 && C().b == 1 && C.c == 1){
        return 1
    } else {
        return 2
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
