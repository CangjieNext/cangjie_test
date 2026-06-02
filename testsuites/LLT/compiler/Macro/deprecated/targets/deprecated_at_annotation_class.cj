// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan class 'CustomAnnotation' is deprecated since 1997. Do not use it.

@Deprecated["Do not use it.", since: "1997"]
@Annotation
public class CustomAnnotation {
    public const init() {}
}

@CustomAnnotation
class Class {}

main(): Unit {}


