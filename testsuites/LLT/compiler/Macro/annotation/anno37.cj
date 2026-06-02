// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

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
    public init(@Ann1["Method"] i!: Int32) {}
    public func foo(@Ann1["method"] j!: Int32) {}
}

main() {}
