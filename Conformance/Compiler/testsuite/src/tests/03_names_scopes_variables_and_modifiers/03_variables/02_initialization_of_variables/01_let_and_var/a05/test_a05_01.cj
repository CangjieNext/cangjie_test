/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_01_a05_01

  @Level:         1
  @Assertion:    3.3.2.1(5) Mutable variables can be assigned multiple times.

  @Description:  Checks that mutable variable can be assigned and re-assigned

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import utils.assert.Assert

let CONST_STR1: String = "1.2353546346e24"
let CONST_STR2: String = """
     -- Еh bien, mon prince. Gênes et Lucques ne sont plus que des apanages,
  des поместья, de la famille Buonaparte.  Non, je  vous préviens, que si vous
  ne  me dites pas, que nous avons la guerre, si vous vous permettez encore de
  pallier  toutes les infamies, toutes les  atrocités  de cet  Antichrist  (ma
  parole, j'y  crois) -- je  ne  vous  connais plus, vous n'êtes plus mon ami,
  vous n'êtes  plus  мой  верный  раб,  comme  vous  dites.  [1]  Ну,
  здравствуйте, здравствуйте.  Je vois  que  je  vous fais  peur, [2]
  садитесь и рассказывайте.
       Так говорила в июле 1805 года известная Анна Павловна Шерер, фрейлина и
  приближенная  императрицы  Марии  Феодоровны,  встречая важного и  чиновного
  князя  Василия,  первого  приехавшего  на  ее вечер. Анна  Павловна  кашляла
  несколько  дней, у  нее был грипп, как она говорила (грипп  был тогда  новое
  слово, употреблявшееся только  редкими).  В записочках, разосланных  утром с
  красным лакеем, было написано без различия во всех:
       "Si vous n'avez rien de mieux à faire, M. le comte (или mon prince), et
  si la perspective de passer la soirée chez une pauvre malade ne vous effraye
  pas  trop,  je serai charmée de vous  voir chez moi  entre 7 et  10  heures.
  Annette Scherer".[3]"""
let CONST_STR3:String = """
[This  is  the  basic text of Sun Tzu on the Art of War. It was
extracted from Mr. Giles' complete work as  titled  above.  The
commentary itself, which, of course includes this work embedded
within it, has been released as suntzu10.txt (or suntzu10.zip).
This  is  being released only as an adjunct to that work, which
contains a wealth of commentary upon this text.]"""

main() {
    var strE = CONST_STR1
    Assert.equals(CONST_STR1, strE, reason: "String value must match")

    strE = "aaa"
    Assert.equals("aaa", strE, reason: "String value must match after re-assignment")

    strE = CONST_STR2
    Assert.equals(CONST_STR2, strE, reason: "String value must match after re-assignment 2")

    strE = CONST_STR3
    Assert.equals(CONST_STR3, strE, reason: "String value must match after re-assignment 3")

    strE = ""
    Assert.equals("", strE, reason: "String value must match after re-assignment 4")
}
