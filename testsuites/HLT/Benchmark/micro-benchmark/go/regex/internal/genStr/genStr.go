/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package genStr

import (
	"errors"
	"fmt"
)

var SpecialChar = [...]string{"*", ".", "+", "?", "^", "$", "|", "{}", "[]", "\\d", "\\w", "\\s"}

var StrLenArray = [...]int{32, 256, 2 * 1024, 16 * 1024}

var MatchCnt = [...]int{1, 4, 32, 128}

func stringBlock(times int, stringSize int, origin string, content string) string {
	blockLen := stringSize / times
	targetSting := ""
	for i := 0; i < times; i++ {
		target := origin
		for j := 0; j < blockLen-len(origin); j++ {
			target += content
		}
		targetSting += target
	}
	for len(targetSting) < stringSize {
		targetSting += content
	}
	return targetSting
}

// GenTestStr generate the test string
func GenTestStr(regex string, times int, stringSize int) (regexString string, matchString string, err error) {

	if times > stringSize {
		fmt.Println("the input parameter is incorrect. times must less than stringSize")
		return "", "", errors.New("time bigger than stringSize")
	}
	switch regex {
	case SpecialChar[0]: // *
		{
			regexString = "zo*"
			matchString = stringBlock(times, stringSize, "zo", "X")
		}
	case SpecialChar[1]: // .
		{
			regexString = "zo."
			matchString = stringBlock(times, stringSize, "zo", "f")
		}
	case SpecialChar[2]: // +
		{
			regexString = "zo+"
			matchString = stringBlock(times, stringSize, "zo", "z")
		}
	case SpecialChar[3]: // ?
		{
			regexString = "zo?"
			matchString = stringBlock(times, stringSize, "zo", "f")
		}
	case SpecialChar[4]: // ^
		{
			regexString = "^zo"
			for i := 0; i < stringSize-2; i++ {
				matchString += "n"
			}
		}
	case SpecialChar[5]: // $
		{
			regexString = "zo$"
			for i := 0; i < stringSize-2; i++ {
				matchString += "n"
			}
			matchString += "zo"
		}
	case SpecialChar[6]: // |
		{
			regexString = "x|y"
			matchString = stringBlock(times, stringSize, "y", "z")
		}
	case SpecialChar[7]: // {}
		{
			regexString = "y{2}"
			matchString = stringBlock(times, stringSize, "yy", "z")
		}
	case SpecialChar[8]: // []
		{
			regexString = "[x|y]"
			matchString = stringBlock(times, stringSize, "xa", "z")
		}
	case SpecialChar[9]: // \\d
		{
			regexString = "\\d"
			matchString = stringBlock(times, stringSize, "1", "X")
		}
	case SpecialChar[10]: // \\w
		{
			regexString = "\\w"
			matchString = stringBlock(times, stringSize, "_", "X")
		}
	case SpecialChar[11]: // \\s
		{
			regexString = "\\s"
			matchString = stringBlock(times, stringSize, "", "X")
		}
	default:
		return " ", "", errors.New("input error")
	}
	return regexString, matchString, nil
}
