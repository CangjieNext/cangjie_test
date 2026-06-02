// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output --debug-macro

@Annotation
public class C20 {
    const init(a: String, b: Int64) {}
    const init() {}
}

@Annotation
public class C21 {
    const init(a: String, b: Int64) {}
    const init() {}
}

class SA5 {
    @C21
    @C20["abc", 6]
    prop i1: Int64 {
        get() {
            return 0
        }
    }
}

main() {}
