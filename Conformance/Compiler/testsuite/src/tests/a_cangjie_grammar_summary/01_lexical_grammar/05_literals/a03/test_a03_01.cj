/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_01_05_a03_01

  @Level:         1
  @Assertion:   A.1.5(3)
                CharacterLiteral
                    : ''' (SingleChar | EscapeSeq ) '''
                    ;
                SingleChar
                    : ~['\r\n]
                    ;
                EscapeSeq
                    : UniCharacterLiteral
                    | EscapedIdentifier
                    ;  
                UniCharacterLiteral
                    : '\\' 'u' '{' HexadecimalDigit '}'
                    | '\\' 'u' '{' HexadecimalDigit HexadecimalDigit '}'
                    | '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit '}'
                    | '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit '}'
                    | '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
                      HexadecimalDigit '}'
                    | '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
                      HexadecimalDigit HexadecimalDigit '}'
                    | '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
                      HexadecimalDigit HexadecimalDigit HexadecimalDigit '}'
                    | '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
                      HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit '}'
                    ; 
                EscapedIdentifier
                    : '\\' ('t' | 'b' | 'r' | 'n' | '\'' | '"' | '\\' | 'f' | 'v' | '0' | '$')
                    ;
  @Description: Check various symbols as CharacterLiteral
  @Comment:     Auto-generated tests by gen_literals_tests_a03.py with seed = 1
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
import utils.assert.Assert

main() {
  
  // Check 'a' symbol as CharacterLiteral
  Assert.isTrue(r'a' is Rune)

  // Check 'b' symbol as CharacterLiteral
  Assert.isTrue(r'b' is Rune)

  // Check 'c' symbol as CharacterLiteral
  Assert.isTrue(r'c' is Rune)

  // Check 'd' symbol as CharacterLiteral
  Assert.isTrue(r'd' is Rune)

  // Check 'e' symbol as CharacterLiteral
  Assert.isTrue(r'e' is Rune)

  // Check 'f' symbol as CharacterLiteral
  Assert.isTrue(r'f' is Rune)

  // Check 'g' symbol as CharacterLiteral
  Assert.isTrue(r'g' is Rune)

  // Check 'h' symbol as CharacterLiteral
  Assert.isTrue(r'h' is Rune)

  // Check 'i' symbol as CharacterLiteral
  Assert.isTrue(r'i' is Rune)

  // Check 'j' symbol as CharacterLiteral
  Assert.isTrue(r'j' is Rune)

  // Check 'k' symbol as CharacterLiteral
  Assert.isTrue(r'k' is Rune)

  // Check 'l' symbol as CharacterLiteral
  Assert.isTrue(r'l' is Rune)

  // Check 'm' symbol as CharacterLiteral
  Assert.isTrue(r'm' is Rune)

  // Check 'n' symbol as CharacterLiteral
  Assert.isTrue(r'n' is Rune)

  // Check 'o' symbol as CharacterLiteral
  Assert.isTrue(r'o' is Rune)

  // Check 'p' symbol as CharacterLiteral
  Assert.isTrue(r'p' is Rune)

  // Check 'q' symbol as CharacterLiteral
  Assert.isTrue(r'q' is Rune)

  // Check 'r' symbol as CharacterLiteral
  Assert.isTrue(r'r' is Rune)

  // Check 's' symbol as CharacterLiteral
  Assert.isTrue(r's' is Rune)

  // Check 't' symbol as CharacterLiteral
  Assert.isTrue(r't' is Rune)

  // Check 'u' symbol as CharacterLiteral
  Assert.isTrue(r'u' is Rune)

  // Check 'v' symbol as CharacterLiteral
  Assert.isTrue(r'v' is Rune)

  // Check 'w' symbol as CharacterLiteral
  Assert.isTrue(r'w' is Rune)

  // Check 'x' symbol as CharacterLiteral
  Assert.isTrue(r'x' is Rune)

  // Check 'y' symbol as CharacterLiteral
  Assert.isTrue(r'y' is Rune)

  // Check 'z' symbol as CharacterLiteral
  Assert.isTrue(r'z' is Rune)

  // Check 'A' symbol as CharacterLiteral
  Assert.isTrue(r'A' is Rune)

  // Check 'B' symbol as CharacterLiteral
  Assert.isTrue(r'B' is Rune)

  // Check 'C' symbol as CharacterLiteral
  Assert.isTrue(r'C' is Rune)

  // Check 'D' symbol as CharacterLiteral
  Assert.isTrue(r'D' is Rune)

  // Check 'E' symbol as CharacterLiteral
  Assert.isTrue(r'E' is Rune)

  // Check 'F' symbol as CharacterLiteral
  Assert.isTrue(r'F' is Rune)

  // Check 'G' symbol as CharacterLiteral
  Assert.isTrue(r'G' is Rune)

  // Check 'H' symbol as CharacterLiteral
  Assert.isTrue(r'H' is Rune)

  // Check 'I' symbol as CharacterLiteral
  Assert.isTrue(r'I' is Rune)

  // Check 'J' symbol as CharacterLiteral
  Assert.isTrue(r'J' is Rune)

  // Check 'K' symbol as CharacterLiteral
  Assert.isTrue(r'K' is Rune)

  // Check 'L' symbol as CharacterLiteral
  Assert.isTrue(r'L' is Rune)

  // Check 'M' symbol as CharacterLiteral
  Assert.isTrue(r'M' is Rune)

  // Check 'N' symbol as CharacterLiteral
  Assert.isTrue(r'N' is Rune)

  // Check 'O' symbol as CharacterLiteral
  Assert.isTrue(r'O' is Rune)

  // Check 'P' symbol as CharacterLiteral
  Assert.isTrue(r'P' is Rune)

  // Check 'Q' symbol as CharacterLiteral
  Assert.isTrue(r'Q' is Rune)

  // Check 'R' symbol as CharacterLiteral
  Assert.isTrue(r'R' is Rune)

  // Check 'S' symbol as CharacterLiteral
  Assert.isTrue(r'S' is Rune)

  // Check 'T' symbol as CharacterLiteral
  Assert.isTrue(r'T' is Rune)

  // Check 'U' symbol as CharacterLiteral
  Assert.isTrue(r'U' is Rune)

  // Check 'V' symbol as CharacterLiteral
  Assert.isTrue(r'V' is Rune)

  // Check 'W' symbol as CharacterLiteral
  Assert.isTrue(r'W' is Rune)

  // Check 'X' symbol as CharacterLiteral
  Assert.isTrue(r'X' is Rune)

  // Check 'Y' symbol as CharacterLiteral
  Assert.isTrue(r'Y' is Rune)

  // Check 'Z' symbol as CharacterLiteral
  Assert.isTrue(r'Z' is Rune)

  // Check 'а' symbol as CharacterLiteral
  Assert.isTrue(r'а' is Rune)

  // Check 'б' symbol as CharacterLiteral
  Assert.isTrue(r'б' is Rune)

  // Check 'в' symbol as CharacterLiteral
  Assert.isTrue(r'в' is Rune)

  // Check 'г' symbol as CharacterLiteral
  Assert.isTrue(r'г' is Rune)

  // Check 'д' symbol as CharacterLiteral
  Assert.isTrue(r'д' is Rune)

  // Check 'е' symbol as CharacterLiteral
  Assert.isTrue(r'е' is Rune)

  // Check 'ё' symbol as CharacterLiteral
  Assert.isTrue(r'ё' is Rune)

  // Check 'ж' symbol as CharacterLiteral
  Assert.isTrue(r'ж' is Rune)

  // Check 'з' symbol as CharacterLiteral
  Assert.isTrue(r'з' is Rune)

  // Check 'и' symbol as CharacterLiteral
  Assert.isTrue(r'и' is Rune)

  // Check 'й' symbol as CharacterLiteral
  Assert.isTrue(r'й' is Rune)

  // Check 'к' symbol as CharacterLiteral
  Assert.isTrue(r'к' is Rune)

  // Check 'л' symbol as CharacterLiteral
  Assert.isTrue(r'л' is Rune)

  // Check 'м' symbol as CharacterLiteral
  Assert.isTrue(r'м' is Rune)

  // Check 'н' symbol as CharacterLiteral
  Assert.isTrue(r'н' is Rune)

  // Check 'о' symbol as CharacterLiteral
  Assert.isTrue(r'о' is Rune)

  // Check 'п' symbol as CharacterLiteral
  Assert.isTrue(r'п' is Rune)

  // Check 'р' symbol as CharacterLiteral
  Assert.isTrue(r'р' is Rune)

  // Check 'с' symbol as CharacterLiteral
  Assert.isTrue(r'с' is Rune)

  // Check 'т' symbol as CharacterLiteral
  Assert.isTrue(r'т' is Rune)

  // Check 'у' symbol as CharacterLiteral
  Assert.isTrue(r'у' is Rune)

  // Check 'ф' symbol as CharacterLiteral
  Assert.isTrue(r'ф' is Rune)

  // Check 'х' symbol as CharacterLiteral
  Assert.isTrue(r'х' is Rune)

  // Check 'ц' symbol as CharacterLiteral
  Assert.isTrue(r'ц' is Rune)

  // Check 'ч' symbol as CharacterLiteral
  Assert.isTrue(r'ч' is Rune)

  // Check 'ш' symbol as CharacterLiteral
  Assert.isTrue(r'ш' is Rune)

  // Check 'щ' symbol as CharacterLiteral
  Assert.isTrue(r'щ' is Rune)

  // Check 'ъ' symbol as CharacterLiteral
  Assert.isTrue(r'ъ' is Rune)

  // Check 'ы' symbol as CharacterLiteral
  Assert.isTrue(r'ы' is Rune)

  // Check 'ь' symbol as CharacterLiteral
  Assert.isTrue(r'ь' is Rune)

  // Check 'э' symbol as CharacterLiteral
  Assert.isTrue(r'э' is Rune)

  // Check 'ю' symbol as CharacterLiteral
  Assert.isTrue(r'ю' is Rune)

  // Check 'я' symbol as CharacterLiteral
  Assert.isTrue(r'я' is Rune)

  // Check 'А' symbol as CharacterLiteral
  Assert.isTrue(r'А' is Rune)

  // Check 'Б' symbol as CharacterLiteral
  Assert.isTrue(r'Б' is Rune)

  // Check 'В' symbol as CharacterLiteral
  Assert.isTrue(r'В' is Rune)

  // Check 'Г' symbol as CharacterLiteral
  Assert.isTrue(r'Г' is Rune)

  // Check 'Д' symbol as CharacterLiteral
  Assert.isTrue(r'Д' is Rune)

  // Check 'Е' symbol as CharacterLiteral
  Assert.isTrue(r'Е' is Rune)

  // Check 'Ё' symbol as CharacterLiteral
  Assert.isTrue(r'Ё' is Rune)

  // Check 'Ж' symbol as CharacterLiteral
  Assert.isTrue(r'Ж' is Rune)

  // Check 'З' symbol as CharacterLiteral
  Assert.isTrue(r'З' is Rune)

  // Check 'И' symbol as CharacterLiteral
  Assert.isTrue(r'И' is Rune)

  // Check 'Й' symbol as CharacterLiteral
  Assert.isTrue(r'Й' is Rune)

  // Check 'К' symbol as CharacterLiteral
  Assert.isTrue(r'К' is Rune)

  // Check 'Л' symbol as CharacterLiteral
  Assert.isTrue(r'Л' is Rune)

  // Check 'М' symbol as CharacterLiteral
  Assert.isTrue(r'М' is Rune)

  // Check 'Н' symbol as CharacterLiteral
  Assert.isTrue(r'Н' is Rune)

  // Check 'О' symbol as CharacterLiteral
  Assert.isTrue(r'О' is Rune)

  // Check 'П' symbol as CharacterLiteral
  Assert.isTrue(r'П' is Rune)

  // Check 'Р' symbol as CharacterLiteral
  Assert.isTrue(r'Р' is Rune)

  // Check 'С' symbol as CharacterLiteral
  Assert.isTrue(r'С' is Rune)

  // Check 'Т' symbol as CharacterLiteral
  Assert.isTrue(r'Т' is Rune)

  // Check 'У' symbol as CharacterLiteral
  Assert.isTrue(r'У' is Rune)

  // Check 'Ф' symbol as CharacterLiteral
  Assert.isTrue(r'Ф' is Rune)

  // Check 'Х' symbol as CharacterLiteral
  Assert.isTrue(r'Х' is Rune)

  // Check 'Ц' symbol as CharacterLiteral
  Assert.isTrue(r'Ц' is Rune)

  // Check 'Ч' symbol as CharacterLiteral
  Assert.isTrue(r'Ч' is Rune)

  // Check 'Ш' symbol as CharacterLiteral
  Assert.isTrue(r'Ш' is Rune)

  // Check 'Щ' symbol as CharacterLiteral
  Assert.isTrue(r'Щ' is Rune)

  // Check 'Ъ' symbol as CharacterLiteral
  Assert.isTrue(r'Ъ' is Rune)

  // Check 'Ы' symbol as CharacterLiteral
  Assert.isTrue(r'Ы' is Rune)

  // Check 'Ь' symbol as CharacterLiteral
  Assert.isTrue(r'Ь' is Rune)

  // Check 'Э' symbol as CharacterLiteral
  Assert.isTrue(r'Э' is Rune)

  // Check 'Ю' symbol as CharacterLiteral
  Assert.isTrue(r'Ю' is Rune)

  // Check 'Я' symbol as CharacterLiteral
  Assert.isTrue(r'Я' is Rune)

  // Check '的' symbol as CharacterLiteral
  Assert.isTrue(r'的' is Rune)

  // Check '一' symbol as CharacterLiteral
  Assert.isTrue(r'一' is Rune)

  // Check '是' symbol as CharacterLiteral
  Assert.isTrue(r'是' is Rune)

  // Check '了' symbol as CharacterLiteral
  Assert.isTrue(r'了' is Rune)

  // Check '我' symbol as CharacterLiteral
  Assert.isTrue(r'我' is Rune)

  // Check '不' symbol as CharacterLiteral
  Assert.isTrue(r'不' is Rune)

  // Check '人' symbol as CharacterLiteral
  Assert.isTrue(r'人' is Rune)

  // Check '在' symbol as CharacterLiteral
  Assert.isTrue(r'在' is Rune)

  // Check '他' symbol as CharacterLiteral
  Assert.isTrue(r'他' is Rune)

  // Check '有' symbol as CharacterLiteral
  Assert.isTrue(r'有' is Rune)

  // Check '这' symbol as CharacterLiteral
  Assert.isTrue(r'这' is Rune)

  // Check '个' symbol as CharacterLiteral
  Assert.isTrue(r'个' is Rune)

  // Check '们' symbol as CharacterLiteral
  Assert.isTrue(r'们' is Rune)

  // Check '中' symbol as CharacterLiteral
  Assert.isTrue(r'中' is Rune)

  // Check '来' symbol as CharacterLiteral
  Assert.isTrue(r'来' is Rune)

  // Check '上' symbol as CharacterLiteral
  Assert.isTrue(r'上' is Rune)

  // Check '大' symbol as CharacterLiteral
  Assert.isTrue(r'大' is Rune)

  // Check '为' symbol as CharacterLiteral
  Assert.isTrue(r'为' is Rune)

  // Check '和' symbol as CharacterLiteral
  Assert.isTrue(r'和' is Rune)

  // Check '国' symbol as CharacterLiteral
  Assert.isTrue(r'国' is Rune)

  // Check '地' symbol as CharacterLiteral
  Assert.isTrue(r'地' is Rune)

  // Check '到' symbol as CharacterLiteral
  Assert.isTrue(r'到' is Rune)

  // Check '以' symbol as CharacterLiteral
  Assert.isTrue(r'以' is Rune)

  // Check '说' symbol as CharacterLiteral
  Assert.isTrue(r'说' is Rune)

  // Check '时' symbol as CharacterLiteral
  Assert.isTrue(r'时' is Rune)

  // Check '要' symbol as CharacterLiteral
  Assert.isTrue(r'要' is Rune)

  // Check '就' symbol as CharacterLiteral
  Assert.isTrue(r'就' is Rune)

  // Check '出' symbol as CharacterLiteral
  Assert.isTrue(r'出' is Rune)

  // Check '会' symbol as CharacterLiteral
  Assert.isTrue(r'会' is Rune)

  // Check '可' symbol as CharacterLiteral
  Assert.isTrue(r'可' is Rune)

  // Check '也' symbol as CharacterLiteral
  Assert.isTrue(r'也' is Rune)

  // Check '你' symbol as CharacterLiteral
  Assert.isTrue(r'你' is Rune)

  // Check '对' symbol as CharacterLiteral
  Assert.isTrue(r'对' is Rune)

  // Check '生' symbol as CharacterLiteral
  Assert.isTrue(r'生' is Rune)

  // Check '能' symbol as CharacterLiteral
  Assert.isTrue(r'能' is Rune)

  // Check '而' symbol as CharacterLiteral
  Assert.isTrue(r'而' is Rune)

  // Check '子' symbol as CharacterLiteral
  Assert.isTrue(r'子' is Rune)

  // Check '那' symbol as CharacterLiteral
  Assert.isTrue(r'那' is Rune)

  // Check '得' symbol as CharacterLiteral
  Assert.isTrue(r'得' is Rune)

  // Check '于' symbol as CharacterLiteral
  Assert.isTrue(r'于' is Rune)

  // Check '着' symbol as CharacterLiteral
  Assert.isTrue(r'着' is Rune)

  // Check '下' symbol as CharacterLiteral
  Assert.isTrue(r'下' is Rune)

  // Check '自' symbol as CharacterLiteral
  Assert.isTrue(r'自' is Rune)

  // Check '之' symbol as CharacterLiteral
  Assert.isTrue(r'之' is Rune)

  // Check '年' symbol as CharacterLiteral
  Assert.isTrue(r'年' is Rune)

  // Check '过' symbol as CharacterLiteral
  Assert.isTrue(r'过' is Rune)

  // Check '发' symbol as CharacterLiteral
  Assert.isTrue(r'发' is Rune)

  // Check '后' symbol as CharacterLiteral
  Assert.isTrue(r'后' is Rune)

  // Check '作' symbol as CharacterLiteral
  Assert.isTrue(r'作' is Rune)

  // Check '里' symbol as CharacterLiteral
  Assert.isTrue(r'里' is Rune)

  // Check '用' symbol as CharacterLiteral
  Assert.isTrue(r'用' is Rune)

  // Check '道' symbol as CharacterLiteral
  Assert.isTrue(r'道' is Rune)

  // Check '行' symbol as CharacterLiteral
  Assert.isTrue(r'行' is Rune)

  // Check '所' symbol as CharacterLiteral
  Assert.isTrue(r'所' is Rune)

  // Check '然' symbol as CharacterLiteral
  Assert.isTrue(r'然' is Rune)

  // Check '家' symbol as CharacterLiteral
  Assert.isTrue(r'家' is Rune)

  // Check '种' symbol as CharacterLiteral
  Assert.isTrue(r'种' is Rune)

  // Check '事' symbol as CharacterLiteral
  Assert.isTrue(r'事' is Rune)

  // Check '成' symbol as CharacterLiteral
  Assert.isTrue(r'成' is Rune)

  // Check '方' symbol as CharacterLiteral
  Assert.isTrue(r'方' is Rune)

  // Check '多' symbol as CharacterLiteral
  Assert.isTrue(r'多' is Rune)

  // Check '经' symbol as CharacterLiteral
  Assert.isTrue(r'经' is Rune)

  // Check '么' symbol as CharacterLiteral
  Assert.isTrue(r'么' is Rune)

  // Check '去' symbol as CharacterLiteral
  Assert.isTrue(r'去' is Rune)

  // Check '法' symbol as CharacterLiteral
  Assert.isTrue(r'法' is Rune)

  // Check '学' symbol as CharacterLiteral
  Assert.isTrue(r'学' is Rune)

  // Check '如' symbol as CharacterLiteral
  Assert.isTrue(r'如' is Rune)

  // Check '都' symbol as CharacterLiteral
  Assert.isTrue(r'都' is Rune)

  // Check '同' symbol as CharacterLiteral
  Assert.isTrue(r'同' is Rune)

  // Check '现' symbol as CharacterLiteral
  Assert.isTrue(r'现' is Rune)

  // Check '当' symbol as CharacterLiteral
  Assert.isTrue(r'当' is Rune)

  // Check '没' symbol as CharacterLiteral
  Assert.isTrue(r'没' is Rune)

  // Check '动' symbol as CharacterLiteral
  Assert.isTrue(r'动' is Rune)

  // Check '面' symbol as CharacterLiteral
  Assert.isTrue(r'面' is Rune)

  // Check '起' symbol as CharacterLiteral
  Assert.isTrue(r'起' is Rune)

  // Check '看' symbol as CharacterLiteral
  Assert.isTrue(r'看' is Rune)

  // Check '定' symbol as CharacterLiteral
  Assert.isTrue(r'定' is Rune)

  // Check '天' symbol as CharacterLiteral
  Assert.isTrue(r'天' is Rune)

  // Check '分' symbol as CharacterLiteral
  Assert.isTrue(r'分' is Rune)

  // Check '还' symbol as CharacterLiteral
  Assert.isTrue(r'还' is Rune)

  // Check '进' symbol as CharacterLiteral
  Assert.isTrue(r'进' is Rune)

  // Check '好' symbol as CharacterLiteral
  Assert.isTrue(r'好' is Rune)

  // Check '小' symbol as CharacterLiteral
  Assert.isTrue(r'小' is Rune)

  // Check '部' symbol as CharacterLiteral
  Assert.isTrue(r'部' is Rune)

  // Check '其' symbol as CharacterLiteral
  Assert.isTrue(r'其' is Rune)

  // Check '些' symbol as CharacterLiteral
  Assert.isTrue(r'些' is Rune)

  // Check '主' symbol as CharacterLiteral
  Assert.isTrue(r'主' is Rune)

  // Check '样' symbol as CharacterLiteral
  Assert.isTrue(r'样' is Rune)

  // Check '理' symbol as CharacterLiteral
  Assert.isTrue(r'理' is Rune)

  // Check '心' symbol as CharacterLiteral
  Assert.isTrue(r'心' is Rune)

  // Check '她' symbol as CharacterLiteral
  Assert.isTrue(r'她' is Rune)

  // Check '本' symbol as CharacterLiteral
  Assert.isTrue(r'本' is Rune)

  // Check '前' symbol as CharacterLiteral
  Assert.isTrue(r'前' is Rune)

  // Check '开' symbol as CharacterLiteral
  Assert.isTrue(r'开' is Rune)

  // Check '但' symbol as CharacterLiteral
  Assert.isTrue(r'但' is Rune)

  // Check '因' symbol as CharacterLiteral
  Assert.isTrue(r'因' is Rune)

  // Check '只' symbol as CharacterLiteral
  Assert.isTrue(r'只' is Rune)

  // Check '从' symbol as CharacterLiteral
  Assert.isTrue(r'从' is Rune)

  // Check '想' symbol as CharacterLiteral
  Assert.isTrue(r'想' is Rune)

  // Check '实' symbol as CharacterLiteral
  Assert.isTrue(r'实' is Rune)

  // Check '日' symbol as CharacterLiteral
  Assert.isTrue(r'日' is Rune)

  // Check '军' symbol as CharacterLiteral
  Assert.isTrue(r'军' is Rune)

  // Check '者' symbol as CharacterLiteral
  Assert.isTrue(r'者' is Rune)

  // Check '意' symbol as CharacterLiteral
  Assert.isTrue(r'意' is Rune)

  // Check '无' symbol as CharacterLiteral
  Assert.isTrue(r'无' is Rune)

  // Check '力' symbol as CharacterLiteral
  Assert.isTrue(r'力' is Rune)

  // Check '它' symbol as CharacterLiteral
  Assert.isTrue(r'它' is Rune)

  // Check '与' symbol as CharacterLiteral
  Assert.isTrue(r'与' is Rune)

  // Check '长' symbol as CharacterLiteral
  Assert.isTrue(r'长' is Rune)

  // Check '把' symbol as CharacterLiteral
  Assert.isTrue(r'把' is Rune)

  // Check '机' symbol as CharacterLiteral
  Assert.isTrue(r'机' is Rune)

  // Check '十' symbol as CharacterLiteral
  Assert.isTrue(r'十' is Rune)

  // Check '民' symbol as CharacterLiteral
  Assert.isTrue(r'民' is Rune)

  // Check '第' symbol as CharacterLiteral
  Assert.isTrue(r'第' is Rune)

  // Check '公' symbol as CharacterLiteral
  Assert.isTrue(r'公' is Rune)

  // Check '此' symbol as CharacterLiteral
  Assert.isTrue(r'此' is Rune)

  // Check '已' symbol as CharacterLiteral
  Assert.isTrue(r'已' is Rune)

  // Check '工' symbol as CharacterLiteral
  Assert.isTrue(r'工' is Rune)

  // Check '使' symbol as CharacterLiteral
  Assert.isTrue(r'使' is Rune)

  // Check '情' symbol as CharacterLiteral
  Assert.isTrue(r'情' is Rune)

  // Check '明' symbol as CharacterLiteral
  Assert.isTrue(r'明' is Rune)

  // Check '性' symbol as CharacterLiteral
  Assert.isTrue(r'性' is Rune)

  // Check '知' symbol as CharacterLiteral
  Assert.isTrue(r'知' is Rune)

  // Check '全' symbol as CharacterLiteral
  Assert.isTrue(r'全' is Rune)

  // Check '三' symbol as CharacterLiteral
  Assert.isTrue(r'三' is Rune)

  // Check '又' symbol as CharacterLiteral
  Assert.isTrue(r'又' is Rune)

  // Check '关' symbol as CharacterLiteral
  Assert.isTrue(r'关' is Rune)

  // Check '点' symbol as CharacterLiteral
  Assert.isTrue(r'点' is Rune)

  // Check '正' symbol as CharacterLiteral
  Assert.isTrue(r'正' is Rune)

  // Check '业' symbol as CharacterLiteral
  Assert.isTrue(r'业' is Rune)

  // Check '外' symbol as CharacterLiteral
  Assert.isTrue(r'外' is Rune)

  // Check '将' symbol as CharacterLiteral
  Assert.isTrue(r'将' is Rune)

  // Check '两' symbol as CharacterLiteral
  Assert.isTrue(r'两' is Rune)

  // Check '高' symbol as CharacterLiteral
  Assert.isTrue(r'高' is Rune)

  // Check '间' symbol as CharacterLiteral
  Assert.isTrue(r'间' is Rune)

  // Check '由' symbol as CharacterLiteral
  Assert.isTrue(r'由' is Rune)

  // Check '问' symbol as CharacterLiteral
  Assert.isTrue(r'问' is Rune)

  // Check '很' symbol as CharacterLiteral
  Assert.isTrue(r'很' is Rune)

  // Check '最' symbol as CharacterLiteral
  Assert.isTrue(r'最' is Rune)

  // Check '重' symbol as CharacterLiteral
  Assert.isTrue(r'重' is Rune)

  // Check '并' symbol as CharacterLiteral
  Assert.isTrue(r'并' is Rune)

  // Check '物' symbol as CharacterLiteral
  Assert.isTrue(r'物' is Rune)

  // Check '手' symbol as CharacterLiteral
  Assert.isTrue(r'手' is Rune)

  // Check '应' symbol as CharacterLiteral
  Assert.isTrue(r'应' is Rune)

  // Check '战' symbol as CharacterLiteral
  Assert.isTrue(r'战' is Rune)

  // Check '向' symbol as CharacterLiteral
  Assert.isTrue(r'向' is Rune)

  // Check '头' symbol as CharacterLiteral
  Assert.isTrue(r'头' is Rune)

  // Check '文' symbol as CharacterLiteral
  Assert.isTrue(r'文' is Rune)

  // Check '体' symbol as CharacterLiteral
  Assert.isTrue(r'体' is Rune)

  // Check '政' symbol as CharacterLiteral
  Assert.isTrue(r'政' is Rune)

  // Check '美' symbol as CharacterLiteral
  Assert.isTrue(r'美' is Rune)

  // Check '相' symbol as CharacterLiteral
  Assert.isTrue(r'相' is Rune)

  // Check '见' symbol as CharacterLiteral
  Assert.isTrue(r'见' is Rune)

  // Check '被' symbol as CharacterLiteral
  Assert.isTrue(r'被' is Rune)

  // Check '利' symbol as CharacterLiteral
  Assert.isTrue(r'利' is Rune)

  // Check '什' symbol as CharacterLiteral
  Assert.isTrue(r'什' is Rune)

  // Check '二' symbol as CharacterLiteral
  Assert.isTrue(r'二' is Rune)

  // Check '等' symbol as CharacterLiteral
  Assert.isTrue(r'等' is Rune)

  // Check '产' symbol as CharacterLiteral
  Assert.isTrue(r'产' is Rune)

  // Check '或' symbol as CharacterLiteral
  Assert.isTrue(r'或' is Rune)

  // Check '新' symbol as CharacterLiteral
  Assert.isTrue(r'新' is Rune)

  // Check '己' symbol as CharacterLiteral
  Assert.isTrue(r'己' is Rune)

  // Check '制' symbol as CharacterLiteral
  Assert.isTrue(r'制' is Rune)

  // Check '身' symbol as CharacterLiteral
  Assert.isTrue(r'身' is Rune)

  // Check '果' symbol as CharacterLiteral
  Assert.isTrue(r'果' is Rune)

  // Check '加' symbol as CharacterLiteral
  Assert.isTrue(r'加' is Rune)

  // Check '西' symbol as CharacterLiteral
  Assert.isTrue(r'西' is Rune)

  // Check '斯' symbol as CharacterLiteral
  Assert.isTrue(r'斯' is Rune)

  // Check '月' symbol as CharacterLiteral
  Assert.isTrue(r'月' is Rune)

  // Check '话' symbol as CharacterLiteral
  Assert.isTrue(r'话' is Rune)

  // Check '合' symbol as CharacterLiteral
  Assert.isTrue(r'合' is Rune)

  // Check '回' symbol as CharacterLiteral
  Assert.isTrue(r'回' is Rune)

  // Check '特' symbol as CharacterLiteral
  Assert.isTrue(r'特' is Rune)

  // Check '代' symbol as CharacterLiteral
  Assert.isTrue(r'代' is Rune)

  // Check '内' symbol as CharacterLiteral
  Assert.isTrue(r'内' is Rune)

  // Check '信' symbol as CharacterLiteral
  Assert.isTrue(r'信' is Rune)

  // Check '表' symbol as CharacterLiteral
  Assert.isTrue(r'表' is Rune)

  // Check '化' symbol as CharacterLiteral
  Assert.isTrue(r'化' is Rune)

  // Check '老' symbol as CharacterLiteral
  Assert.isTrue(r'老' is Rune)

  // Check '给' symbol as CharacterLiteral
  Assert.isTrue(r'给' is Rune)

  // Check '世' symbol as CharacterLiteral
  Assert.isTrue(r'世' is Rune)

  // Check '位' symbol as CharacterLiteral
  Assert.isTrue(r'位' is Rune)

  // Check '次' symbol as CharacterLiteral
  Assert.isTrue(r'次' is Rune)

  // Check '度' symbol as CharacterLiteral
  Assert.isTrue(r'度' is Rune)

  // Check '门' symbol as CharacterLiteral
  Assert.isTrue(r'门' is Rune)

  // Check '任' symbol as CharacterLiteral
  Assert.isTrue(r'任' is Rune)

  // Check '常' symbol as CharacterLiteral
  Assert.isTrue(r'常' is Rune)

  // Check '先' symbol as CharacterLiteral
  Assert.isTrue(r'先' is Rune)

  // Check '海' symbol as CharacterLiteral
  Assert.isTrue(r'海' is Rune)

  // Check '通' symbol as CharacterLiteral
  Assert.isTrue(r'通' is Rune)

  // Check '教' symbol as CharacterLiteral
  Assert.isTrue(r'教' is Rune)

  // Check '儿' symbol as CharacterLiteral
  Assert.isTrue(r'儿' is Rune)

  // Check '原' symbol as CharacterLiteral
  Assert.isTrue(r'原' is Rune)

  // Check '东' symbol as CharacterLiteral
  Assert.isTrue(r'东' is Rune)

  // Check '声' symbol as CharacterLiteral
  Assert.isTrue(r'声' is Rune)

  // Check '提' symbol as CharacterLiteral
  Assert.isTrue(r'提' is Rune)

  // Check '立' symbol as CharacterLiteral
  Assert.isTrue(r'立' is Rune)

  // Check '及' symbol as CharacterLiteral
  Assert.isTrue(r'及' is Rune)

  // Check '比' symbol as CharacterLiteral
  Assert.isTrue(r'比' is Rune)

  // Check '员' symbol as CharacterLiteral
  Assert.isTrue(r'员' is Rune)

  // Check '解' symbol as CharacterLiteral
  Assert.isTrue(r'解' is Rune)

  // Check '水' symbol as CharacterLiteral
  Assert.isTrue(r'水' is Rune)

  // Check '名' symbol as CharacterLiteral
  Assert.isTrue(r'名' is Rune)

  // Check '真' symbol as CharacterLiteral
  Assert.isTrue(r'真' is Rune)

  // Check '论' symbol as CharacterLiteral
  Assert.isTrue(r'论' is Rune)

  // Check '处' symbol as CharacterLiteral
  Assert.isTrue(r'处' is Rune)

  // Check '走' symbol as CharacterLiteral
  Assert.isTrue(r'走' is Rune)

  // Check '义' symbol as CharacterLiteral
  Assert.isTrue(r'义' is Rune)

  // Check '各' symbol as CharacterLiteral
  Assert.isTrue(r'各' is Rune)

  // Check '入' symbol as CharacterLiteral
  Assert.isTrue(r'入' is Rune)

  // Check '几' symbol as CharacterLiteral
  Assert.isTrue(r'几' is Rune)

  // Check '口' symbol as CharacterLiteral
  Assert.isTrue(r'口' is Rune)

  // Check '认' symbol as CharacterLiteral
  Assert.isTrue(r'认' is Rune)

  // Check '条' symbol as CharacterLiteral
  Assert.isTrue(r'条' is Rune)

  // Check '平' symbol as CharacterLiteral
  Assert.isTrue(r'平' is Rune)

  // Check '系' symbol as CharacterLiteral
  Assert.isTrue(r'系' is Rune)

  // Check '气' symbol as CharacterLiteral
  Assert.isTrue(r'气' is Rune)

  // Check '题' symbol as CharacterLiteral
  Assert.isTrue(r'题' is Rune)

  // Check '活' symbol as CharacterLiteral
  Assert.isTrue(r'活' is Rune)

  // Check '尔' symbol as CharacterLiteral
  Assert.isTrue(r'尔' is Rune)

  // Check '更' symbol as CharacterLiteral
  Assert.isTrue(r'更' is Rune)

  // Check '别' symbol as CharacterLiteral
  Assert.isTrue(r'别' is Rune)

  // Check '打' symbol as CharacterLiteral
  Assert.isTrue(r'打' is Rune)

  // Check '女' symbol as CharacterLiteral
  Assert.isTrue(r'女' is Rune)

  // Check '变' symbol as CharacterLiteral
  Assert.isTrue(r'变' is Rune)

  // Check '四' symbol as CharacterLiteral
  Assert.isTrue(r'四' is Rune)

  // Check '神' symbol as CharacterLiteral
  Assert.isTrue(r'神' is Rune)

  // Check '总' symbol as CharacterLiteral
  Assert.isTrue(r'总' is Rune)

  // Check '何' symbol as CharacterLiteral
  Assert.isTrue(r'何' is Rune)

  // Check '电' symbol as CharacterLiteral
  Assert.isTrue(r'电' is Rune)

  // Check '数' symbol as CharacterLiteral
  Assert.isTrue(r'数' is Rune)

  // Check '安' symbol as CharacterLiteral
  Assert.isTrue(r'安' is Rune)

  // Check '少' symbol as CharacterLiteral
  Assert.isTrue(r'少' is Rune)

  // Check '报' symbol as CharacterLiteral
  Assert.isTrue(r'报' is Rune)

  // Check '才' symbol as CharacterLiteral
  Assert.isTrue(r'才' is Rune)

  // Check '结' symbol as CharacterLiteral
  Assert.isTrue(r'结' is Rune)

  // Check '反' symbol as CharacterLiteral
  Assert.isTrue(r'反' is Rune)

  // Check '受' symbol as CharacterLiteral
  Assert.isTrue(r'受' is Rune)

  // Check '目' symbol as CharacterLiteral
  Assert.isTrue(r'目' is Rune)

  // Check '太' symbol as CharacterLiteral
  Assert.isTrue(r'太' is Rune)

  // Check '量' symbol as CharacterLiteral
  Assert.isTrue(r'量' is Rune)

  // Check '再' symbol as CharacterLiteral
  Assert.isTrue(r'再' is Rune)

  // Check '感' symbol as CharacterLiteral
  Assert.isTrue(r'感' is Rune)

  // Check '建' symbol as CharacterLiteral
  Assert.isTrue(r'建' is Rune)

  // Check '务' symbol as CharacterLiteral
  Assert.isTrue(r'务' is Rune)

  // Check '做' symbol as CharacterLiteral
  Assert.isTrue(r'做' is Rune)

  // Check '接' symbol as CharacterLiteral
  Assert.isTrue(r'接' is Rune)

  // Check '必' symbol as CharacterLiteral
  Assert.isTrue(r'必' is Rune)

  // Check '场' symbol as CharacterLiteral
  Assert.isTrue(r'场' is Rune)

  // Check '件' symbol as CharacterLiteral
  Assert.isTrue(r'件' is Rune)

  // Check '计' symbol as CharacterLiteral
  Assert.isTrue(r'计' is Rune)

  // Check '管' symbol as CharacterLiteral
  Assert.isTrue(r'管' is Rune)

  // Check '期' symbol as CharacterLiteral
  Assert.isTrue(r'期' is Rune)

  // Check '市' symbol as CharacterLiteral
  Assert.isTrue(r'市' is Rune)

  // Check '直' symbol as CharacterLiteral
  Assert.isTrue(r'直' is Rune)

  // Check '德' symbol as CharacterLiteral
  Assert.isTrue(r'德' is Rune)

  // Check '资' symbol as CharacterLiteral
  Assert.isTrue(r'资' is Rune)

  // Check '命' symbol as CharacterLiteral
  Assert.isTrue(r'命' is Rune)

  // Check '山' symbol as CharacterLiteral
  Assert.isTrue(r'山' is Rune)

  // Check '金' symbol as CharacterLiteral
  Assert.isTrue(r'金' is Rune)

  // Check '指' symbol as CharacterLiteral
  Assert.isTrue(r'指' is Rune)

  // Check '克' symbol as CharacterLiteral
  Assert.isTrue(r'克' is Rune)

  // Check '许' symbol as CharacterLiteral
  Assert.isTrue(r'许' is Rune)

  // Check '统' symbol as CharacterLiteral
  Assert.isTrue(r'统' is Rune)

  // Check '区' symbol as CharacterLiteral
  Assert.isTrue(r'区' is Rune)

  // Check '保' symbol as CharacterLiteral
  Assert.isTrue(r'保' is Rune)

  // Check '至' symbol as CharacterLiteral
  Assert.isTrue(r'至' is Rune)

  // Check '队' symbol as CharacterLiteral
  Assert.isTrue(r'队' is Rune)

  // Check '形' symbol as CharacterLiteral
  Assert.isTrue(r'形' is Rune)

  // Check '社' symbol as CharacterLiteral
  Assert.isTrue(r'社' is Rune)

  // Check '便' symbol as CharacterLiteral
  Assert.isTrue(r'便' is Rune)

  // Check '空' symbol as CharacterLiteral
  Assert.isTrue(r'空' is Rune)

  // Check '决' symbol as CharacterLiteral
  Assert.isTrue(r'决' is Rune)

  // Check '治' symbol as CharacterLiteral
  Assert.isTrue(r'治' is Rune)

  // Check '展' symbol as CharacterLiteral
  Assert.isTrue(r'展' is Rune)

  // Check '马' symbol as CharacterLiteral
  Assert.isTrue(r'马' is Rune)

  // Check '科' symbol as CharacterLiteral
  Assert.isTrue(r'科' is Rune)

  // Check '司' symbol as CharacterLiteral
  Assert.isTrue(r'司' is Rune)

  // Check '五' symbol as CharacterLiteral
  Assert.isTrue(r'五' is Rune)

  // Check '基' symbol as CharacterLiteral
  Assert.isTrue(r'基' is Rune)

  // Check '眼' symbol as CharacterLiteral
  Assert.isTrue(r'眼' is Rune)

  // Check '书' symbol as CharacterLiteral
  Assert.isTrue(r'书' is Rune)

  // Check '非' symbol as CharacterLiteral
  Assert.isTrue(r'非' is Rune)

  // Check '则' symbol as CharacterLiteral
  Assert.isTrue(r'则' is Rune)

  // Check '听' symbol as CharacterLiteral
  Assert.isTrue(r'听' is Rune)

  // Check '白' symbol as CharacterLiteral
  Assert.isTrue(r'白' is Rune)

  // Check '却' symbol as CharacterLiteral
  Assert.isTrue(r'却' is Rune)

  // Check '界' symbol as CharacterLiteral
  Assert.isTrue(r'界' is Rune)

  // Check '达' symbol as CharacterLiteral
  Assert.isTrue(r'达' is Rune)

  // Check '光' symbol as CharacterLiteral
  Assert.isTrue(r'光' is Rune)

  // Check '放' symbol as CharacterLiteral
  Assert.isTrue(r'放' is Rune)

  // Check '强' symbol as CharacterLiteral
  Assert.isTrue(r'强' is Rune)

  // Check '即' symbol as CharacterLiteral
  Assert.isTrue(r'即' is Rune)

  // Check '像' symbol as CharacterLiteral
  Assert.isTrue(r'像' is Rune)

  // Check '难' symbol as CharacterLiteral
  Assert.isTrue(r'难' is Rune)

  // Check '且' symbol as CharacterLiteral
  Assert.isTrue(r'且' is Rune)

  // Check '权' symbol as CharacterLiteral
  Assert.isTrue(r'权' is Rune)

  // Check '思' symbol as CharacterLiteral
  Assert.isTrue(r'思' is Rune)

  // Check '王' symbol as CharacterLiteral
  Assert.isTrue(r'王' is Rune)

  // Check '象' symbol as CharacterLiteral
  Assert.isTrue(r'象' is Rune)

  // Check '完' symbol as CharacterLiteral
  Assert.isTrue(r'完' is Rune)

  // Check '设' symbol as CharacterLiteral
  Assert.isTrue(r'设' is Rune)

  // Check '式' symbol as CharacterLiteral
  Assert.isTrue(r'式' is Rune)

  // Check '色' symbol as CharacterLiteral
  Assert.isTrue(r'色' is Rune)

  // Check '路' symbol as CharacterLiteral
  Assert.isTrue(r'路' is Rune)

  // Check '记' symbol as CharacterLiteral
  Assert.isTrue(r'记' is Rune)

  // Check '南' symbol as CharacterLiteral
  Assert.isTrue(r'南' is Rune)

  // Check '品' symbol as CharacterLiteral
  Assert.isTrue(r'品' is Rune)

  // Check '住' symbol as CharacterLiteral
  Assert.isTrue(r'住' is Rune)

  // Check '告' symbol as CharacterLiteral
  Assert.isTrue(r'告' is Rune)

  // Check '类' symbol as CharacterLiteral
  Assert.isTrue(r'类' is Rune)

  // Check '求' symbol as CharacterLiteral
  Assert.isTrue(r'求' is Rune)

  // Check '据' symbol as CharacterLiteral
  Assert.isTrue(r'据' is Rune)

  // Check '程' symbol as CharacterLiteral
  Assert.isTrue(r'程' is Rune)

  // Check '北' symbol as CharacterLiteral
  Assert.isTrue(r'北' is Rune)

  // Check '边' symbol as CharacterLiteral
  Assert.isTrue(r'边' is Rune)

  // Check '死' symbol as CharacterLiteral
  Assert.isTrue(r'死' is Rune)

  // Check '张' symbol as CharacterLiteral
  Assert.isTrue(r'张' is Rune)

  // Check '该' symbol as CharacterLiteral
  Assert.isTrue(r'该' is Rune)

  // Check '交' symbol as CharacterLiteral
  Assert.isTrue(r'交' is Rune)

  // Check '规' symbol as CharacterLiteral
  Assert.isTrue(r'规' is Rune)

  // Check '万' symbol as CharacterLiteral
  Assert.isTrue(r'万' is Rune)

  // Check '取' symbol as CharacterLiteral
  Assert.isTrue(r'取' is Rune)

  // Check '拉' symbol as CharacterLiteral
  Assert.isTrue(r'拉' is Rune)

  // Check '格' symbol as CharacterLiteral
  Assert.isTrue(r'格' is Rune)

  // Check '望' symbol as CharacterLiteral
  Assert.isTrue(r'望' is Rune)

  // Check '觉' symbol as CharacterLiteral
  Assert.isTrue(r'觉' is Rune)

  // Check '术' symbol as CharacterLiteral
  Assert.isTrue(r'术' is Rune)

  // Check '领' symbol as CharacterLiteral
  Assert.isTrue(r'领' is Rune)

  // Check '共' symbol as CharacterLiteral
  Assert.isTrue(r'共' is Rune)

  // Check '确' symbol as CharacterLiteral
  Assert.isTrue(r'确' is Rune)

  // Check '传' symbol as CharacterLiteral
  Assert.isTrue(r'传' is Rune)

  // Check '师' symbol as CharacterLiteral
  Assert.isTrue(r'师' is Rune)

  // Check '观' symbol as CharacterLiteral
  Assert.isTrue(r'观' is Rune)

  // Check '清' symbol as CharacterLiteral
  Assert.isTrue(r'清' is Rune)

  // Check '今' symbol as CharacterLiteral
  Assert.isTrue(r'今' is Rune)

  // Check '切' symbol as CharacterLiteral
  Assert.isTrue(r'切' is Rune)

  // Check '院' symbol as CharacterLiteral
  Assert.isTrue(r'院' is Rune)

  // Check '让' symbol as CharacterLiteral
  Assert.isTrue(r'让' is Rune)

  // Check '识' symbol as CharacterLiteral
  Assert.isTrue(r'识' is Rune)

  // Check '候' symbol as CharacterLiteral
  Assert.isTrue(r'候' is Rune)

  // Check '带' symbol as CharacterLiteral
  Assert.isTrue(r'带' is Rune)

  // Check '导' symbol as CharacterLiteral
  Assert.isTrue(r'导' is Rune)

  // Check '争' symbol as CharacterLiteral
  Assert.isTrue(r'争' is Rune)

  // Check '运' symbol as CharacterLiteral
  Assert.isTrue(r'运' is Rune)

  // Check '笑' symbol as CharacterLiteral
  Assert.isTrue(r'笑' is Rune)

  // Check '飞' symbol as CharacterLiteral
  Assert.isTrue(r'飞' is Rune)

  // Check '风' symbol as CharacterLiteral
  Assert.isTrue(r'风' is Rune)

  // Check '步' symbol as CharacterLiteral
  Assert.isTrue(r'步' is Rune)

  // Check '改' symbol as CharacterLiteral
  Assert.isTrue(r'改' is Rune)

  // Check '收' symbol as CharacterLiteral
  Assert.isTrue(r'收' is Rune)

  // Check '根' symbol as CharacterLiteral
  Assert.isTrue(r'根' is Rune)

  // Check '干' symbol as CharacterLiteral
  Assert.isTrue(r'干' is Rune)

  // Check '造' symbol as CharacterLiteral
  Assert.isTrue(r'造' is Rune)

  // Check '言' symbol as CharacterLiteral
  Assert.isTrue(r'言' is Rune)

  // Check '联' symbol as CharacterLiteral
  Assert.isTrue(r'联' is Rune)

  // Check '持' symbol as CharacterLiteral
  Assert.isTrue(r'持' is Rune)

  // Check '组' symbol as CharacterLiteral
  Assert.isTrue(r'组' is Rune)

  // Check '每' symbol as CharacterLiteral
  Assert.isTrue(r'每' is Rune)

  // Check '济' symbol as CharacterLiteral
  Assert.isTrue(r'济' is Rune)

  // Check '车' symbol as CharacterLiteral
  Assert.isTrue(r'车' is Rune)

  // Check '亲' symbol as CharacterLiteral
  Assert.isTrue(r'亲' is Rune)

  // Check '极' symbol as CharacterLiteral
  Assert.isTrue(r'极' is Rune)

  // Check '林' symbol as CharacterLiteral
  Assert.isTrue(r'林' is Rune)

  // Check '服' symbol as CharacterLiteral
  Assert.isTrue(r'服' is Rune)

  // Check '快' symbol as CharacterLiteral
  Assert.isTrue(r'快' is Rune)

  // Check '办' symbol as CharacterLiteral
  Assert.isTrue(r'办' is Rune)

  // Check '议' symbol as CharacterLiteral
  Assert.isTrue(r'议' is Rune)

  // Check '往' symbol as CharacterLiteral
  Assert.isTrue(r'往' is Rune)

  // Check '元' symbol as CharacterLiteral
  Assert.isTrue(r'元' is Rune)

  // Check '英' symbol as CharacterLiteral
  Assert.isTrue(r'英' is Rune)

  // Check '士' symbol as CharacterLiteral
  Assert.isTrue(r'士' is Rune)

  // Check '证' symbol as CharacterLiteral
  Assert.isTrue(r'证' is Rune)

  // Check '近' symbol as CharacterLiteral
  Assert.isTrue(r'近' is Rune)

  // Check '失' symbol as CharacterLiteral
  Assert.isTrue(r'失' is Rune)

  // Check '转' symbol as CharacterLiteral
  Assert.isTrue(r'转' is Rune)

  // Check '夫' symbol as CharacterLiteral
  Assert.isTrue(r'夫' is Rune)

  // Check '令' symbol as CharacterLiteral
  Assert.isTrue(r'令' is Rune)

  // Check '准' symbol as CharacterLiteral
  Assert.isTrue(r'准' is Rune)

  // Check '布' symbol as CharacterLiteral
  Assert.isTrue(r'布' is Rune)

  // Check '始' symbol as CharacterLiteral
  Assert.isTrue(r'始' is Rune)

  // Check '怎' symbol as CharacterLiteral
  Assert.isTrue(r'怎' is Rune)

  // Check '呢' symbol as CharacterLiteral
  Assert.isTrue(r'呢' is Rune)

  // Check '存' symbol as CharacterLiteral
  Assert.isTrue(r'存' is Rune)

  // Check '未' symbol as CharacterLiteral
  Assert.isTrue(r'未' is Rune)

  // Check '远' symbol as CharacterLiteral
  Assert.isTrue(r'远' is Rune)

  // Check '叫' symbol as CharacterLiteral
  Assert.isTrue(r'叫' is Rune)

  // Check '台' symbol as CharacterLiteral
  Assert.isTrue(r'台' is Rune)

  // Check '单' symbol as CharacterLiteral
  Assert.isTrue(r'单' is Rune)

  // Check '影' symbol as CharacterLiteral
  Assert.isTrue(r'影' is Rune)

  // Check '具' symbol as CharacterLiteral
  Assert.isTrue(r'具' is Rune)

  // Check '罗' symbol as CharacterLiteral
  Assert.isTrue(r'罗' is Rune)

  // Check '字' symbol as CharacterLiteral
  Assert.isTrue(r'字' is Rune)

  // Check '爱' symbol as CharacterLiteral
  Assert.isTrue(r'爱' is Rune)

  // Check '击' symbol as CharacterLiteral
  Assert.isTrue(r'击' is Rune)

  // Check '流' symbol as CharacterLiteral
  Assert.isTrue(r'流' is Rune)

  // Check '备' symbol as CharacterLiteral
  Assert.isTrue(r'备' is Rune)

  // Check '兵' symbol as CharacterLiteral
  Assert.isTrue(r'兵' is Rune)

  // Check '连' symbol as CharacterLiteral
  Assert.isTrue(r'连' is Rune)

  // Check '调' symbol as CharacterLiteral
  Assert.isTrue(r'调' is Rune)

  // Check '深' symbol as CharacterLiteral
  Assert.isTrue(r'深' is Rune)

  // Check '商' symbol as CharacterLiteral
  Assert.isTrue(r'商' is Rune)

  // Check '算' symbol as CharacterLiteral
  Assert.isTrue(r'算' is Rune)

  // Check '质' symbol as CharacterLiteral
  Assert.isTrue(r'质' is Rune)

  // Check '团' symbol as CharacterLiteral
  Assert.isTrue(r'团' is Rune)

  // Check '集' symbol as CharacterLiteral
  Assert.isTrue(r'集' is Rune)

  // Check '百' symbol as CharacterLiteral
  Assert.isTrue(r'百' is Rune)

  // Check '需' symbol as CharacterLiteral
  Assert.isTrue(r'需' is Rune)

  // Check '价' symbol as CharacterLiteral
  Assert.isTrue(r'价' is Rune)

  // Check '花' symbol as CharacterLiteral
  Assert.isTrue(r'花' is Rune)

  // Check '党' symbol as CharacterLiteral
  Assert.isTrue(r'党' is Rune)

  // Check '华' symbol as CharacterLiteral
  Assert.isTrue(r'华' is Rune)

  // Check '城' symbol as CharacterLiteral
  Assert.isTrue(r'城' is Rune)

  // Check '石' symbol as CharacterLiteral
  Assert.isTrue(r'石' is Rune)

  // Check '级' symbol as CharacterLiteral
  Assert.isTrue(r'级' is Rune)

  // Check '整' symbol as CharacterLiteral
  Assert.isTrue(r'整' is Rune)

  // Check '府' symbol as CharacterLiteral
  Assert.isTrue(r'府' is Rune)

  // Check '离' symbol as CharacterLiteral
  Assert.isTrue(r'离' is Rune)

  // Check '况' symbol as CharacterLiteral
  Assert.isTrue(r'况' is Rune)

  // Check '亚' symbol as CharacterLiteral
  Assert.isTrue(r'亚' is Rune)

  // Check '请' symbol as CharacterLiteral
  Assert.isTrue(r'请' is Rune)

  // Check '技' symbol as CharacterLiteral
  Assert.isTrue(r'技' is Rune)

  // Check '际' symbol as CharacterLiteral
  Assert.isTrue(r'际' is Rune)

  // Check '约' symbol as CharacterLiteral
  Assert.isTrue(r'约' is Rune)

  // Check '示' symbol as CharacterLiteral
  Assert.isTrue(r'示' is Rune)

  // Check '复' symbol as CharacterLiteral
  Assert.isTrue(r'复' is Rune)

  // Check '病' symbol as CharacterLiteral
  Assert.isTrue(r'病' is Rune)

  // Check '息' symbol as CharacterLiteral
  Assert.isTrue(r'息' is Rune)

  // Check '究' symbol as CharacterLiteral
  Assert.isTrue(r'究' is Rune)

  // Check '线' symbol as CharacterLiteral
  Assert.isTrue(r'线' is Rune)

  // Check '似' symbol as CharacterLiteral
  Assert.isTrue(r'似' is Rune)

  // Check '官' symbol as CharacterLiteral
  Assert.isTrue(r'官' is Rune)

  // Check '火' symbol as CharacterLiteral
  Assert.isTrue(r'火' is Rune)

  // Check '断' symbol as CharacterLiteral
  Assert.isTrue(r'断' is Rune)

  // Check '精' symbol as CharacterLiteral
  Assert.isTrue(r'精' is Rune)

  // Check '满' symbol as CharacterLiteral
  Assert.isTrue(r'满' is Rune)

  // Check '支' symbol as CharacterLiteral
  Assert.isTrue(r'支' is Rune)

  // Check '视' symbol as CharacterLiteral
  Assert.isTrue(r'视' is Rune)

  // Check '消' symbol as CharacterLiteral
  Assert.isTrue(r'消' is Rune)

  // Check '越' symbol as CharacterLiteral
  Assert.isTrue(r'越' is Rune)

  // Check '器' symbol as CharacterLiteral
  Assert.isTrue(r'器' is Rune)

  // Check '容' symbol as CharacterLiteral
  Assert.isTrue(r'容' is Rune)

  // Check '照' symbol as CharacterLiteral
  Assert.isTrue(r'照' is Rune)

  // Check '须' symbol as CharacterLiteral
  Assert.isTrue(r'须' is Rune)

  // Check '九' symbol as CharacterLiteral
  Assert.isTrue(r'九' is Rune)

  // Check '增' symbol as CharacterLiteral
  Assert.isTrue(r'增' is Rune)

  // Check '研' symbol as CharacterLiteral
  Assert.isTrue(r'研' is Rune)

  // Check '写' symbol as CharacterLiteral
  Assert.isTrue(r'写' is Rune)

  // Check '称' symbol as CharacterLiteral
  Assert.isTrue(r'称' is Rune)

  // Check '企' symbol as CharacterLiteral
  Assert.isTrue(r'企' is Rune)

  // Check '八' symbol as CharacterLiteral
  Assert.isTrue(r'八' is Rune)

  // Check '功' symbol as CharacterLiteral
  Assert.isTrue(r'功' is Rune)

  // Check '吗' symbol as CharacterLiteral
  Assert.isTrue(r'吗' is Rune)

  // Check '\t' symbol as CharacterLiteral
  Assert.isTrue(r'\t' is Rune)

  // Check '\b' symbol as CharacterLiteral
  Assert.isTrue(r'\b' is Rune)

  // Check '\r' symbol as CharacterLiteral
  Assert.isTrue(r'\r' is Rune)

  // Check '\n' symbol as CharacterLiteral
  Assert.isTrue(r'\n' is Rune)

  // Check '\'' symbol as CharacterLiteral
  Assert.isTrue(r'\'' is Rune)

  // Check '\"' symbol as CharacterLiteral
  Assert.isTrue(r'\"' is Rune)

  // Check '\\' symbol as CharacterLiteral
  Assert.isTrue(r'\\' is Rune)

  // Check '\f' symbol as CharacterLiteral
  Assert.isTrue(r'\f' is Rune)

  // Check '\v' symbol as CharacterLiteral
  Assert.isTrue(r'\v' is Rune)

  // Check '\0' symbol as CharacterLiteral
  Assert.isTrue(r'\0' is Rune)

  // Check '\$' symbol as CharacterLiteral
  Assert.isTrue(r'\$' is Rune)

  // Check '\u{4}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{4}' is Rune)

  // Check '\u{C}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{C}' is Rune)

  // Check '\u{28}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{28}' is Rune)

  // Check '\u{3f}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{3f}' is Rune)

  // Check '\u{efE}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{efE}' is Rune)

  // Check '\u{c63}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{c63}' is Rune)

  // Check '\u{f0cd}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{f0cd}' is Rune)

  // Check '\u{D0e8}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{D0e8}' is Rune)

  // Check '\u{7C3a0}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{C3a0}' is Rune)

  // Check '\u{00EB0}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{0EB0}' is Rune)

  // Check '\u{cF6d0A}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{6d0A}' is Rune)

  // Check '\u{7efB7b}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{fB7b}' is Rune)

  // Check '\u{7F7e90d}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{e90d}' is Rune)

  // Check '\u{BE35E93}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{5E93}' is Rune)

  // Check '\u{2eFA35Ac}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{35Ac}' is Rune)

  // Check '\u{6BB7cAbC}' symbol as CharacterLiteral
  Assert.isTrue(r'\u{cAbC}' is Rune)

  return 0
}
