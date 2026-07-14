/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#ifndef RUNTIME_BASE_TEST_H
#define RUNTIME_BASE_TEST_H

#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <mutex>
#include <vector>

enum RTLogLevel {
  RTLOG_VERBOSE,
  RTLOG_DEBUG,
  RTLOG_INFO,
  RTLOG_REPORT,
  RTLOG_WARNING,
  RTLOG_ERROR,
  RTLOG_FAIL,
  RTLOG_FATAL,
  RTLOG_OFF
};

namespace MapleRuntime {
class FixedCString {
public:
  FixedCString();
  FixedCString(const char *initStr);
  FixedCString(const FixedCString &other);
  FixedCString &operator=(const FixedCString &other);
  ~FixedCString();

  size_t Length() const;
  const char *Str() const noexcept;
  bool IsEmpty() const;

private:
  static constexpr size_t C_STRING_MAX_SIZE = 2048;
  char mem[C_STRING_MAX_SIZE] = {0};
  size_t length = 0;
};

// These declarations mirror the exported Runtime ABI. The test links the
// instrumented Runtime dylib; it does not compile a second CString.cpp/Log.cpp.
class CString {
public:
  CString();
  CString(const char *initStr);
  explicit CString(char c);
  explicit CString(int64_t number);
  explicit CString(int32_t number);
  explicit CString(uint64_t number);
  explicit CString(uint32_t number);
  CString(size_t number, char ch);
  explicit CString(const FixedCString &other);
  CString(const CString &other);
  CString &operator=(const CString &other);
  ~CString();

  void EnsureSpace(size_t addLen);
  CString &Append(const char *addStr, size_t addLen = 0);
  CString &Append(const CString &addStr, size_t addLen = 0);
  CString Combine(const char *addStr) const;
  CString Combine(const CString &addStr) const;
  size_t Length() const;
  const char *Str() const noexcept;
  char *GetStr() const noexcept;
  bool IsEmpty() const { return length == 0; }
  CString &Truncate(size_t index);
  CString &Insert(size_t index, const char *addStr);
  int Find(const char *subStr, size_t begin = 0) const;
  int Find(char chr, size_t begin = 0) const;
  int RFind(const char *subStr) const;
  CString SubStr(size_t index, size_t len) const;
  CString SubStr(size_t index) const;
  CString RemoveBlankSpace() const;
  void Replace(size_t pos, CString cStr);
  static std::vector<CString> Split(CString &source, char separator = ' ');
  static char *BaseName(const CString &path);
  static CString FormatString(const char *format, ...);
  static size_t ParseSizeFromEnv(const CString &env);
  static uint64_t ParseTimeFromEnv(const CString &env);
  static int ParseNumFromEnv(const CString &env);
  static size_t ParsePosNumFromEnv(const CString &env);
  static double ParseValidFromEnv(const CString &env);
  static double ParsePosDecFromEnv(const CString &env);
  static bool ParseFlagFromEnv(const CString &value);
  static bool IsPosNumber(const CString &value);
  static bool IsPosDecimal(const CString &value);
  static bool IsNumber(const CString &value);

  bool operator==(const CString &other) const;
  bool operator!=(const CString &other) const;

private:
  static constexpr size_t C_STRING_MIN_SIZE = 16;
  char *str = nullptr;
  size_t capacity = C_STRING_MIN_SIZE;
  size_t length = 0;
};

using LogHandle = void (*)(const char *msg);

class Logger {
public:
  Logger();
  static Logger &GetLogger() noexcept;
  bool InitLog();
  void FormatLog(RTLogLevel level, bool notInSigHandler, const char *format,
                 ...) noexcept;
  RTLogLevel GetMinimumLogLevel() const;
  void SetMinimumLogLevel(RTLogLevel level);
  static bool MaybeRotate(size_t curPos, size_t maxSize, FILE *file);
  static size_t GetLogFileSize();
  static void GetLogPath(const char *env, CString &logPath);
  bool CheckLogLevel(RTLogLevel level);
  static void RegisterLogHandle(LogHandle handle);
  static void InvokeLogHandle(const char *msg);

private:
  FILE *fd = nullptr;
  RTLogLevel minimumLogLevel;
  size_t maxFileSize;
  std::recursive_mutex logMutex;
  CString filePath = nullptr;
  size_t curPosLocation = 0;
};

bool IsHaveCommandInjection(const CString &logPath);

enum LogType {
  REPORT = 0,
  DEBUG,
  ALLOC,
  REGION,
  FRAGMENT,
  BARRIER,
  EBARRIER,
  TBARRIER,
  PBARRIER,
  FBARRIER,
  GCPHASE,
  ENUM,
  TRACE,
  PREFORWARD,
  FORWARD,
  FIX,
  FINALIZE,
  UNWIND,
  EXCEPTION,
  SIGNAL,
  CJTHREAD,
  INTERPRETER,
  LOG_TYPE_NUMBER
};

class LogFile {
public:
  struct LogFileItem {
    bool enableLog = false;
    std::mutex fileMutex;
    FILE *file = nullptr;
    size_t maxFileSize = 10UL * 1024UL * 1024UL;
    size_t curPosLocation = 0;
  };

  static void Init();
  static void Fini();
  static FILE *GetFile(LogType type);
  static bool LogIsEnabled(LogType type) noexcept;
  static size_t GetMaxFileSize(LogType type);
  static size_t GetCurPosLocation(LogType type);
  static void SetCurPosLocation(LogType type, size_t curPos);
  static RTLogLevel GetLogLevel();

  static LogFileItem logFile[LOG_TYPE_NUMBER];
};

CString Pretty(uint64_t number) noexcept;
CString PrettyOrderInfo(uint64_t number, const char *unit);
CString PrettyOrderMathNano(uint64_t number, const char *unit);
RTLogLevel InitLogLevel();
void WriteLog(bool addPrefix, LogType type, const char *format, ...) noexcept;

enum class VersionType {
  MAJOR = 0,
  MINOR,
  PATCH,
  PRE_RELEASE,
  BUILD_METADATA,
  VERSION_TYPE_NUMBER
};

struct SemanticVersionInfo {
  size_t major = 0;
  size_t minor = 0;
  size_t patch = 0;
  CString preRelease;
  CString buildMetaData;

  SemanticVersionInfo() = default;
  explicit SemanticVersionInfo(CString &version);
  ~SemanticVersionInfo() = default;
};

class CjSemanticVersion {
public:
  CjSemanticVersion();
  ~CjSemanticVersion() = default;
  const char *GetRuntimeSDKVersion();
  bool CheckPackageCompatibility(CString &packageName, CString &binaryVersion);
  bool IsCompatible(CString &binaryVersion);
  bool IsUnstableVersion(SemanticVersionInfo &version);

private:
  SemanticVersionInfo runtimeSemanticVersionInfo;
  SemanticVersionInfo stableSemanticVersionInfo;
};
} // namespace MapleRuntime

extern "C" void MRT_DumpLog(const char *message);

#endif
