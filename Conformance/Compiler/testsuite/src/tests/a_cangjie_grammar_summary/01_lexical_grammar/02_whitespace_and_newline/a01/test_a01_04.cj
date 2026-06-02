
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_01_02_a01_04

  @Level:         1
  @Assertion:   A.1.2(1) 
                WS
                    : [\u0020\u0009\u000C]
                    ;
  @Description: Check usage white spaces in diffent places
  @Comment:     Auto-generated tests by gen_ws_nl_tests_a01.py with seed = 1
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       6212
*/
import utils.assert.Assert

		   

main()   	     {
  var  	 	   t1: Int64 = 	   	 123
  Assert.equals(123,  			 t1)
  return 		  	 0
}
		 	 	
