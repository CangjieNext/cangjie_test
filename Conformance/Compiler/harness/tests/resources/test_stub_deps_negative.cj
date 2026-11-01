/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        test_stub_deps_negative

  @Description: Stub for LangRunner tests: negative compile-only test with a dependency

  @Mode:        compileonly

  @Negative:    yes

  @Structure:   complex-main

  @Dependencies: aux_stub_failed.cj
*/

import aux_stub_pkg.*

main(): Unit {
    @stub(0)
}
