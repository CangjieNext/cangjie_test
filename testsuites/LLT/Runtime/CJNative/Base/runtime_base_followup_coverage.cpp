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

using MapleRuntime::CjSemanticVersion;
using MapleRuntime::CString;
using MapleRuntime::FixedCString;
using MapleRuntime::SemanticVersionInfo;

static SemanticVersionInfo ParseVersion(const char *text) {
  CString input(text);
  return SemanticVersionInfo(input);
}

static void CheckFixedCString() {
  FixedCString empty;
  FixedCString value("fixed-value");
  FixedCString copied(value);
  FixedCString assigned("old");

  assert(empty.IsEmpty());
  assert(empty.Length() == 0);
  assert(std::strcmp(value.Str(), "fixed-value") == 0);
  assert(copied.Length() == value.Length());
  assert(std::strcmp(copied.Str(), value.Str()) == 0);

  assigned = value;
  assert(std::strcmp(assigned.Str(), "fixed-value") == 0);
  assigned = assigned;
  assert(std::strcmp(assigned.Str(), "fixed-value") == 0);
  assigned = empty;
  assert(assigned.IsEmpty());

  CString converted(value);
  assert(std::strcmp(converted.Str(), "fixed-value") == 0);
}

static void CheckSemanticVersionParsing() {
  auto empty = ParseVersion("");
  assert(empty.major == 0 && empty.minor == 0 && empty.patch == 0);

  auto core = ParseVersion("1.2.3");
  assert(core.major == 1 && core.minor == 2 && core.patch == 3);
  assert(core.preRelease.IsEmpty() && core.buildMetaData.IsEmpty());

  auto prerelease = ParseVersion("1.2.3-alpha");
  assert(std::strcmp(prerelease.preRelease.Str(), "alpha") == 0);
  assert(prerelease.buildMetaData.IsEmpty());

  auto metadata = ParseVersion("1.2.3+build.7");
  assert(metadata.preRelease.IsEmpty());
  assert(std::strcmp(metadata.buildMetaData.Str(), "build.7") == 0);

  auto complete = ParseVersion("1.2.3-rc.1+build.9");
  assert(complete.major == 1 && complete.minor == 2 && complete.patch == 3);
  assert(std::strcmp(complete.preRelease.Str(), "rc.1") == 0);
  assert(std::strcmp(complete.buildMetaData.Str(), "build.9") == 0);

  auto trailingDash = ParseVersion("1.2.3-");
  auto trailingPlus = ParseVersion("1.2.3+");
  auto wrongOrder = ParseVersion("1.2.3+build-alpha");
  auto tooShort = ParseVersion("1.2");
  auto tooLong = ParseVersion("1.2.3.4");
  assert(trailingDash.major == 0 && trailingPlus.major == 0);
  assert(wrongOrder.major == 0 && tooShort.major == 0 && tooLong.major == 0);
}

static void CheckSemanticCompatibility() {
  CjSemanticVersion compatibility;
  const char *runtimeText = compatibility.GetRuntimeSDKVersion();
  assert(runtimeText != nullptr && runtimeText[0] != '\0');

  CString runtimeVersion(runtimeText);
  CString packageName("runtime-llt-user-package");
  assert(compatibility.IsCompatible(runtimeVersion));
  assert(compatibility.CheckPackageCompatibility(packageName, runtimeVersion));

  CString incompatible("9.0.0");
  assert(!compatibility.IsCompatible(incompatible));
  assert(!compatibility.CheckPackageCompatibility(packageName, incompatible));

  auto older = ParseVersion("0.59.5");
  auto stable = ParseVersion("0.59.6");
  auto newerMinor = ParseVersion("0.60.0");
  auto newerMajor = ParseVersion("1.0.0");
  assert(compatibility.IsUnstableVersion(older));
  assert(!compatibility.IsUnstableVersion(stable));
  assert(!compatibility.IsUnstableVersion(newerMinor));
  assert(!compatibility.IsUnstableVersion(newerMajor));
}

int main() {
  CheckFixedCString();
  CheckSemanticVersionParsing();
  CheckSemanticCompatibility();
  std::puts("runtime base followup coverage pass");
  return 0;
}
