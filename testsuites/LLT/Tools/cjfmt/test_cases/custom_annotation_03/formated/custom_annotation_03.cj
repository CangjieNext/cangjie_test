// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

@Annotation
public class CustomAnnotation {
    let name: String
    let version: Int64
    public const init(name: String, version!: Int64 = 0) {
        this.name = name
        this.version = version
    }
}

// use annotation
@CustomAnnotation["Sample", version: 1]
class Foo {}

main() {}
