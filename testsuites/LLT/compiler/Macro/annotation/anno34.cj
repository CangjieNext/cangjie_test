// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output

@Annotation
public class Ann1 {
    let name: String
    const init(name: String) {
        this.name = name
    }
}

@Ann1["methods"]
class D {
    public D(
        @Ann1["Method"] let i: Int32,
        @Ann1["method"] var j: Int32
    ) {}
}

main() {}
