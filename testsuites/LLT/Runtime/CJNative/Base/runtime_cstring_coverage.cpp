/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "runtime_base_test.h"

#include <cassert>
#include <cstring>
#include <limits>

using MapleRuntime::CString;

static void CheckConstructionAndEditing() {
  CString empty;
  CString emptyLiteral("");
  CString nullString(nullptr);
  assert(empty.IsEmpty() && emptyLiteral.IsEmpty() && nullString.IsEmpty());
  assert(nullString.Str() == nullptr);

  CString letter('Q');
  CString signed32(static_cast<int32_t>(-123));
  CString signed64(static_cast<int64_t>(-9876543210LL));
  CString unsigned32(static_cast<uint32_t>(123));
  CString unsigned64(static_cast<uint64_t>(9876543210ULL));
  assert(std::strcmp(letter.Str(), "Q") == 0);
  assert(std::strcmp(signed32.Str(), "-123") == 0);
  assert(std::strcmp(signed64.Str(), "-9876543210") == 0);
  assert(std::strcmp(unsigned32.Str(), "123") == 0);
  assert(std::strcmp(unsigned64.Str(), "9876543210") == 0);

  CString repeated(40, 'x');
  assert(repeated.Length() == 40);
  CString copied(repeated);
  copied = copied;
  assert(copied == repeated);
  copied = empty;
  assert(copied.IsEmpty());

  CString value("alpha");
  value.EnsureSpace(0);
  value.EnsureSpace(1);
  value.EnsureSpace(80);
  value.Append(nullptr).Append("").Append("-beta");
  value.Append(CString()).Append(CString("-gamma"), 3);
  assert(std::strcmp(value.Str(), "alpha-beta-ga") == 0);
  assert(value.GetStr() != nullptr);

  CString combined = value.Combine("-tail");
  CString combinedAgain = combined.Combine(CString("-end"));
  assert(combinedAgain.Find("tail") >= 0);
  assert(combinedAgain.Find('e') >= 0);
  assert(combinedAgain.Find('z') == -1);
  assert(combinedAgain.Find("tail", combinedAgain.Length()) == -1);
  assert(combinedAgain.Find('a', combinedAgain.Length()) == -1);
  assert(combinedAgain.RFind("-end") ==
         static_cast<int>(combinedAgain.Length() - 4));
  assert(combinedAgain.RFind("missing") == -1);

  CString original("abcdef");
  original.Truncate(original.Length());
  original.Insert(original.Length(), "x");
  original.Insert(2, "");
  original.Insert(3, "XYZ");
  assert(std::strcmp(original.Str(), "abcXYZdef") == 0);
  original.Replace(3, CString("123"));
  assert(std::strcmp(original.Str(), "abc123def") == 0);

  assert(std::strcmp(original.SubStr(3, 3).Str(), "123") == 0);
  assert(std::strcmp(original.SubStr(6).Str(), "def") == 0);
  assert(original.SubStr(8, 2).IsEmpty());
  assert(original.SubStr(original.Length()).IsEmpty());
  assert(std::strcmp(CString(" a b  c ").RemoveBlankSpace().Str(), "abc") == 0);
  assert(CString("").RemoveBlankSpace().IsEmpty());

  CString tokensSource("one::two:three");
  auto tokens = CString::Split(tokensSource, ':');
  assert(tokens.size() == 3);
  assert(std::strcmp(tokens[0].Str(), "one") == 0);
  CString noTokens("");
  assert(CString::Split(noTokens, ':').empty());
  CString path("/tmp/runtime/file.txt");
  assert(std::strcmp(CString::BaseName(path), "file.txt") == 0);

  assert(std::strcmp(CString::FormatString("%s-%d", "value", 7).Str(),
                     "value-7") == 0);
  CString huge(400, 'z');
  assert(std::strcmp(CString::FormatString("%s", huge.Str()).Str(),
                     "invalid arguments for FormatString") == 0);
}

static void CheckEnvironmentParsing() {
  assert(CString::ParseSizeFromEnv(CString("1")) == 0);
  assert(CString::ParseSizeFromEnv(CString("2kb")) == 2);
  assert(CString::ParseSizeFromEnv(CString(" 3 MB ")) == 3 * 1024UL);
  assert(CString::ParseSizeFromEnv(CString("1GB")) == 1024UL * 1024UL);
  assert(CString::ParseSizeFromEnv(CString("0kb")) == 0);
  assert(CString::ParseSizeFromEnv(CString("2tb")) == 0);
  assert(CString::ParseSizeFromEnv(CString("xmb")) == 0);

  assert(CString::ParseTimeFromEnv(CString("1")) == 0);
  assert(CString::ParseTimeFromEnv(CString("2s")) == 2000000000ULL);
  assert(CString::ParseTimeFromEnv(CString("3ns")) == 3);
  assert(CString::ParseTimeFromEnv(CString("4US")) == 4000);
  assert(CString::ParseTimeFromEnv(CString("5ms")) == 5000000);
  assert(CString::ParseTimeFromEnv(CString("6xs")) == 0);
  assert(CString::ParseTimeFromEnv(CString("xms")) == 0);

  assert(CString::ParseNumFromEnv(CString(" -42 ")) == -42);
  assert(CString::ParseNumFromEnv(CString("4x")) == 0);
  assert(CString::ParsePosNumFromEnv(CString("+17")) == 17);
  assert(CString::ParsePosNumFromEnv(CString("-1")) == 0);
  assert(CString::ParsePosDecFromEnv(CString("2.5")) == 2.5);
  assert(CString::ParsePosDecFromEnv(CString("-2.5")) == 0.0);
  assert(CString::ParseValidFromEnv(CString("0.25")) == 0.25);
  assert(CString::ParseValidFromEnv(CString("bad")) == -1.0);

  assert(CString::ParseFlagFromEnv(CString("1")));
  assert(CString::ParseFlagFromEnv(CString("true")));
  assert(CString::ParseFlagFromEnv(CString("TRUE")));
  assert(!CString::ParseFlagFromEnv(CString("True")));

  assert(!CString::IsPosNumber(CString("")));
  assert(!CString::IsPosNumber(CString("+")));
  assert(!CString::IsPosNumber(CString("0")));
  assert(CString::IsPosNumber(CString("+123")));
  assert(!CString::IsPosNumber(CString("12x")));
  assert(CString::IsPosDecimal(CString("1.25")));
  assert(!CString::IsPosDecimal(CString("0")));
  assert(!CString::IsPosDecimal(CString("1.2x")));
  assert(!CString::IsNumber(CString("")));
  assert(CString::IsNumber(CString("-12")));
  assert(CString::IsNumber(CString("-")));
  assert(!CString::IsNumber(CString("+12")));
}

int main() {
  CheckConstructionAndEditing();
  CheckEnvironmentParsing();
  std::puts("runtime cstring coverage pass");
  return 0;
}
