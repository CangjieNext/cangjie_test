/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_01_a07_positive

  @Level:         1

  @Assertion:    1.3.1(7) The syntax of integer literals is:
  @Description:  Compiler integer literal syntaxis

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert

main(){     
Assert.equals(10i8                   ,10i8              )
Assert.equals(77u8                   ,77u8              )
Assert.equals(375i16                 ,375i16            )
Assert.equals(257u16                 ,257u16            )
Assert.equals(77777i32               ,77777i32          )
Assert.equals(7654389u32             ,7654389u32        )
Assert.equals(123497654321i64        ,123497654321i64   )
Assert.equals(10_1991010_1010u64     ,10_1991010_1010u64)
                                                                   
Assert.equals(0b1___________________u8  ,0b1___________________u8  )
Assert.equals(0b1010_1010_1010_1010_u16 ,0b1010_1010_1010_1010_u16 )
Assert.equals(0b1010_1010_1010_1010_u32 ,0b1010_1010_1010_1010_u32 )
Assert.equals(0b1010_1010_1010_1010_u64 ,0b1010_1010_1010_1010_u64 )                                                                                                                                     
Assert.equals(0b1___________________i8  ,0b1___________________i8  )
Assert.equals(0b00________0010_1010_i16 ,0b00________0010_1010_i16 )
Assert.equals(0b1010_1010_1010_1010_i32 ,0b1010_1010_1010_1010_i32 )
Assert.equals(0b1010_1010_1010_1010_i64 ,0b1010_1010_1010_1010_i64 )                                                                  
                                                                   
Assert.equals(0o1________i8             ,0o1________i8             )
Assert.equals(0O10101____i16            ,0O10101____i16            )
Assert.equals(0O10171010_i32            ,0O10171010_i32            )
Assert.equals(0o10101010_i64            ,0o10101010_i64            )
                                                                   
Assert.equals(0x1________i8             ,0x1________i8             )
Assert.equals(0x00e01____i16            ,0x00e01____i16            )
Assert.equals(0x10151010_i32            ,0x10151010_i32            )
Assert.equals(0x101d1010_i64            ,0x101d1010_i64            )

}
