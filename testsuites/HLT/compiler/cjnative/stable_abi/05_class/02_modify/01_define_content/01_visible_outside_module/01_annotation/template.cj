/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: modify annotation
@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public class A {}

@Version["1.1"]
public class B {}

@Version["1.2"]
public class C {}


