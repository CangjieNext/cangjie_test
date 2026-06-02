/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_01_a12_03

  @Level:         1

  @Assertion:    2.1.6.1(12)
                 // empty multi-line raw string
                 let empty1 = #""#
                 // empty multi-line raw string
                 let empty2 = ##""##
                 /*
                 The result of s2 is:
                 This
                 is a multi-line string
                 */
                 let s2 = ##"
                 This
                 is a multi-line raw string"##
                 /*
                 The result of s3 is:
                 This is a\n
                 multi-line string
                 */
                 let s3 = #"This is a\n
                 multi-line string"#
                 /*
                 The result of s4 is:
                 This is a "#
                 */
                 let s4 = ##" This is a "#
                 "##
                 // Error: the beginning and ending numbers of `#` are not matched.
                 let errorStr1 = ##" error string "#
                 // Error: the beginning and ending numbers of `#` are not matched.
                 let errorStr2 = ##" error string "###
                 // Error: the string literal is terminated when meeting the first matched `"##`.
                 let errorStr3 = ##" error string "## error "##

  @Description:  Negative example from specification.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

main() {
    // Error: the string literal is terminated when meeting the first matched `"##`.
    let errorStr3 = ##" error string "## error "##
}