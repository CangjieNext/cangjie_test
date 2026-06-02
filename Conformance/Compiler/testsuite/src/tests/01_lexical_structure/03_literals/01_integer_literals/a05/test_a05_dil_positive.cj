/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_01_a05_dil_positive

  @Level:         1

  @Assertion:    1.3.1(5) Decimal literals do not require a prefix
                  
  @Description:  Compiler check decimal literals of all types

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert

main(){
   Assert.equals (10i8              ,10i8              )
   Assert.equals (77u8              ,77u8              )
   Assert.equals (375i16            ,375i16            )
   Assert.equals (257u16            ,257u16            )
   Assert.equals (77777i32          ,77777i32          )
   Assert.equals (7654389u32        ,7654389u32        )
   Assert.equals (123497654321i64   ,123497654321i64   )
   Assert.equals (10_1991010_1010u64,10_1991010_1010u64)
}
