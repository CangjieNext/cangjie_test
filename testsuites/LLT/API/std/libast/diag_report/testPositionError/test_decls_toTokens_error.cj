// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %f -o %output

import define.*

public class MyTest {
    @Inject
    public var a = String.empty
}

main() {
    return 0
}

/* SCAN-IN
error: The Inject macro only be used on a field with private modifier
 ==> test_decls_toTokens_error.cj:9:5:
  | 
9 |     public var a = String.empty
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^ Modify the field with private keyword
  | 

1 error generated, 1 error printed.
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
