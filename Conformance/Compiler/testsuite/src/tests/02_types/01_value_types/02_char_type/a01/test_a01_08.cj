/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_02_a01_08

  @Level:         1

  @Assertion:    2.1.2(1) The Cangjie programming language uses Rune to represent characters type.
   A value of type Rune is a Unicode code point. Characters can be classified into printable characters,
   non-printable characters (such as control characters), and special characters 
   (such as single quotation marks and backslashes).
 
  @Description:  Check that Rune type can contain Chinese characters

  @Mode:         run

  @Negative:     no

  @Structure:    single
  
*/

import utils.assert.Assert

main() {
  let characters = [r'的',r'一',r'是',r'了',r'我',r'不',r'人',r'在', r'他',r'有',r'这',r'个',r'们',r'中',r'来',
    r'上',r'大',r'为',r'和',r'国',r'地',r'到',r'以',r'说',r'时',r'要',r'就',r'出',r'会',r'可',r'也',r'你',r'对',
    r'生',r'能',r'而',r'子',r'那',r'得',r'于',r'着',r'下',r'自',r'之',r'年',r'过',r'发',r'后',r'作',r'里',r'用',
    r'道',r'行',r'所',r'然',r'家',r'种',r'事',r'成',r'方',r'多',r'经',r'么',r'去',r'法',r'学',r'如',r'都',r'同',
    r'现',r'当',r'没',r'动',r'面',r'起',r'看',r'定',r'天',r'分',r'还',r'进',r'好',r'小',r'部',r'其',r'些',r'主',
    r'样',r'理',r'心',r'她',r'本',r'前',r'开',r'但',r'因',r'只',r'从',r'想',r'实',r'日',r'军',r'者',r'意',r'无',
    r'力',r'它',r'与',r'长',r'把',r'机',r'十',r'民',r'第',r'公',r'此',r'已',r'工',r'使',r'情',r'明',r'性',r'知',
    r'全',r'三',r'又',r'关',r'点',r'正',r'业',r'外',r'将',r'两',r'高',r'间',r'由',r'问',r'很',r'最',r'重',r'并',
    r'物',r'手',r'应',r'战',r'向',r'头',r'文',r'体',r'政',r'美',r'相',r'见',r'被',r'利',r'什',r'二',r'等',r'产',
    r'或',r'新',r'己',r'制',r'身',r'果',r'加',r'西',r'斯',r'月',r'话',r'合',r'回',r'特',r'代',r'内',r'信',r'表',
    r'化',r'老',r'给',r'世',r'位',r'次',r'度',r'门',r'任',r'常',r'先',r'海',r'通',r'教',r'儿',r'原',r'东',r'声',
    r'提',r'立',r'及',r'比',r'员',r'解',r'水',r'名',r'真',r'论',r'处',r'走',r'义',r'各',r'入',r'几',r'口',r'认',
    r'条',r'平',r'系',r'气',r'题',r'活',r'尔',r'更',r'别',r'打',r'女',r'变',r'四',r'神',r'总',r'何',r'电',r'数',
    r'安',r'少',r'报',r'才',r'结',r'反',r'受',r'目',r'太',r'量',r'再',r'感',r'建',r'务',r'做',r'接',r'必',r'场',
    r'件',r'计',r'管',r'期',r'市',r'直',r'德',r'资',r'命',r'山',r'金',r'指',r'克',r'许',r'统',r'区',r'保',r'至',
    r'队',r'形',r'社',r'便',r'空',r'决',r'治',r'展',r'马',r'科',r'司',r'五',r'基',r'眼',r'书',r'非',r'则',r'听',
    r'白',r'却',r'界',r'达',r'光',r'放',r'强',r'即',r'像',r'难',r'且',r'权',r'思',r'王',r'象',r'完',r'设',r'式',
    r'色',r'路',r'记',r'南',r'品',r'住',r'告',r'类',r'求',r'据',r'程',r'北',r'边',r'死',r'张',r'该',r'交',r'规',
    r'万',r'取',r'拉',r'格',r'望',r'觉',r'术',r'领',r'共',r'确',r'传',r'师',r'观',r'清',r'今',r'切',r'院',r'让',
    r'识',r'候',r'带',r'导',r'争',r'运',r'笑',r'飞',r'风',r'步',r'改',r'收',r'根',r'干',r'造',r'言',r'联',r'持',
    r'组',r'每',r'济',r'车',r'亲',r'极',r'林',r'服',r'快',r'办',r'议',r'往',r'元',r'英',r'士',r'证',r'近',r'失',
    r'转',r'夫',r'令',r'准',r'布',r'始',r'怎',r'呢',r'存',r'未',r'远',r'叫',r'台',r'单',r'影',r'具',r'罗',r'字',
    r'爱',r'击',r'流',r'备',r'兵',r'连',r'调',r'深',r'商',r'算',r'质',r'团',r'集',r'百',r'需',r'价',r'花',r'党',
    r'华',r'城',r'石',r'级',r'整',r'府',r'离',r'况',r'亚',r'请',r'技',r'际',r'约',r'示',r'复',r'病',r'息',r'究',
    r'线',r'似',r'官',r'火',r'断',r'精',r'满',r'支',r'视',r'消',r'越',r'器',r'容',r'照',r'须',r'九',r'增',r'研',
    r'写',r'称',r'企',r'八',r'功',r'吗']
  for (char in characters) {
    var a: Rune
    a = char
    Assert.equals(char, a)
  }
}