# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

'''
Methods for getting characters.

The grammar is:

CharacterLiteral
: '\'' (SingleChar | EscapeSeq ) '\''
;
SingleChar
: ~['\\\r\n]
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
HexadecimalDigit HexadecimalDigit '}' ↪
| '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
HexadecimalDigit HexadecimalDigit HexadecimalDigit '}' ↪
| '\\' 'u' '{' HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit '}' ↪
;
EscapedIdentifier
: '\\' ('t' | 'b' | 'r' | 'n' | '\'' | '"' | '\\' | 'f' | 'v' | '0' | '$')
;
'''

import random
import string

def get_random_uni_char_literal(ch_len = -1):
    '''Get random UniCharacterLiteral value'''
    if ch_len == -1:
        ch_len = random.randint(1,8)
    res = '\\u{'
    res_hex = 'FFFFFFFF'
    while int(f'0x{res_hex}', 16) > int('0x7fffffff', 16): # Current max possible Unicode value is 0x7fffffff
        res_hex = ''
        for _ in range(ch_len):
            hex_digit = random.choice('0123456789abcdefABCDEF')
            res_hex += hex_digit
    res += res_hex
    res += '}'
    return res

class Rune():
    '''Rune representation'''
    # SingleChar
    CHARS = list(string.ascii_letters)
    CHARS += ['а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о',
        'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я']
    CHARS += ['А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М',
        'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ',
        'Ы', 'Ь', 'Э', 'Ю', 'Я']
    CHARS += ['的','一','是','了','我','不','人','在', '他','有','这','个','们','中','来',
        '上','大','为','和','国','地','到','以','说','时','要','就','出','会','可','也','你','对',
        '生','能','而','子','那','得','于','着','下','自','之','年','过','发','后','作','里','用',
        '道','行','所','然','家','种','事','成','方','多','经','么','去','法','学','如','都','同',
        '现','当','没','动','面','起','看','定','天','分','还','进','好','小','部','其','些','主',
        '样','理','心','她','本','前','开','但','因','只','从','想','实','日','军','者','意','无',
        '力','它','与','长','把','机','十','民','第','公','此','已','工','使','情','明','性','知',
        '全','三','又','关','点','正','业','外','将','两','高','间','由','问','很','最','重','并',
        '物','手','应','战','向','头','文','体','政','美','相','见','被','利','什','二','等','产',
        '或','新','己','制','身','果','加','西','斯','月','话','合','回','特','代','内','信','表',
        '化','老','给','世','位','次','度','门','任','常','先','海','通','教','儿','原','东','声',
        '提','立','及','比','员','解','水','名','真','论','处','走','义','各','入','几','口','认',
        '条','平','系','气','题','活','尔','更','别','打','女','变','四','神','总','何','电','数',
        '安','少','报','才','结','反','受','目','太','量','再','感','建','务','做','接','必','场',
        '件','计','管','期','市','直','德','资','命','山','金','指','克','许','统','区','保','至',
        '队','形','社','便','空','决','治','展','马','科','司','五','基','眼','书','非','则','听',
        '白','却','界','达','光','放','强','即','像','难','且','权','思','王','象','完','设','式',
        '色','路','记','南','品','住','告','类','求','据','程','北','边','死','张','该','交','规',
        '万','取','拉','格','望','觉','术','领','共','确','传','师','观','清','今','切','院','让',
        '识','候','带','导','争','运','笑','飞','风','步','改','收','根','干','造','言','联','持',
        '组','每','济','车','亲','极','林','服','快','办','议','往','元','英','士','证','近','失',
        '转','夫','令','准','布','始','怎','呢','存','未','远','叫','台','单','影','具','罗','字',
        '爱','击','流','备','兵','连','调','深','商','算','质','团','集','百','需','价','花','党',
        '华','城','石','级','整','府','离','况','亚','请','技','际','约','示','复','病','息','究',
        '线','似','官','火','断','精','满','支','视','消','越','器','容','照','须','九','增','研',
        '写','称','企','八','功','吗']
    #EscapedIdentifier
    ESCAPED_IDENTIFIER = ['\\t', '\\b', '\\r', '\\n', '\\\'', '\\"', '\\\\', '\\f', '\\v', '\\0', '\\$']

    def __init__(self, value = None) -> None:
        self._type = 'Rune'
        if value is None:
            ch_type = random.randint(0,2)
            if ch_type == 0:
                self._value = random.choice(Rune.CHARS)
            elif ch_type == 1:
                self._value = random.choice(Rune.ESCAPED_IDENTIFIER)
            else: #UniCharacterLiteral
                self._value = get_random_uni_char_literal()
        else:
            self._value = value

    @property
    def value(self) -> str:
        '''Value of Rune type'''
        return "'" + self._value + "'"

    @property
    def clean_value(self) -> str:
        '''Value of Rune type without qoutes'''
        return self._value

    @property
    def type(self) -> str:
        '''Rune type string'''
        return self._type

def get_char(value = None):
    '''Get random char'''
    return Rune(value)

def get_all_chars():
    '''Get all variations of characters from predefined pool'''
    res = []
    for value in Rune.CHARS:
        res.append(Rune(value))
    for value in Rune.ESCAPED_IDENTIFIER:
        res.append(Rune(value))
    for ch_len in range(1,9):
        res.append(Rune(get_random_uni_char_literal(ch_len)))
        res.append(Rune(get_random_uni_char_literal(ch_len)))
    return res
