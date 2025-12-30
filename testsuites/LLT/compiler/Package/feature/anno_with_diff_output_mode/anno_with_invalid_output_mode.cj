// EXEC-PIPE-1:%compiler %noColor anno_with_invalid_output_mode.cj 2>&1 | compare %f
/* SCAN
error: annotation '@NonProduct' is not compatible with '--output-type=exe'
  ==> anno_with_invalid_output_mode.cj:18:1:
   | 
18 | @NonProduct
   | ^^^^^^^^^^^ 
   | 
   # note: @NonProduct works with '--output-type=chir' only

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
@NonProduct
features { os.linux }
package default

main() {
  println("Hello, world!")
}