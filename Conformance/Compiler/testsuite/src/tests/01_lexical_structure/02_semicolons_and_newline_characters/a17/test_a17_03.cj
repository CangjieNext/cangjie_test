/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a17_03

  @Level:         1

  @Assertion:    1.2(17) For multi-line comment, the comment is terminated by the first '*'/

  @Description:  Check the each '*'/ terminates own comment that is an item of parent multi-line comment.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

main() {
/*
    /*
	comment
		Unpack archive with the plugin
        /*
              comment 
	      Go to the
"Extensions" tab (Ctrl + Shift + X). Select from above:
three dots->Install from VSIX.
	*/
    */
*/
}