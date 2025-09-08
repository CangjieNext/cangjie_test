public struct S{
    public var a = 0
    public let b = 0
    public static const c = 0
}

main() {
    if (S().a == 0 && S().b == 0 && S.c == 0) {
        return 0
    } else if (S().a == 1 && S().b == 1 && S.c == 1){
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
