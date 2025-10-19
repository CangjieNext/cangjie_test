// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt --experimental --output-type=chir %f 2>&1 | compare %f
// ASSERT: scan error: 'common' and 'private' modifier conflict on property 'size' declaration

package FOO

class Foo {}

common extend Foo {
     common private prop size: Int64 {
          get() {
               0
          }
     }
}