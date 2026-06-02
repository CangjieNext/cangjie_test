// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan undeclared identifier 'M'
// ASSERT: scan undeclared identifier 'M1'

@Annotation
public class JsonName {
    public const JsonName(public let name: String) {
    }
}

class Worker {
    Worker(
        @JsonName["姓名"] public let name: String,
        @JsonName["年龄"] public let age: Int64
    ) {
    }
}

func test(
    @M a11: Int64,
    @M1 b: Int64
) {
}

main() {}


