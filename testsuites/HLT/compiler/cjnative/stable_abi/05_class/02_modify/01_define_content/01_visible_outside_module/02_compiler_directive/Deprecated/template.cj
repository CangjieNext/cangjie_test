/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: @Deprecated

public class B1 {}
public class BG1<T> {}

@Deprecated["This API will be deprecated soon"]
public class C1 {}
@Deprecated["This API will be deprecated soon"]
public class CG1<T> {}

@Deprecated["This API is deprecated", strict: true]
public class D1 {}
@Deprecated["This API is deprecated", strict: true]
public class DG1<T> {}


