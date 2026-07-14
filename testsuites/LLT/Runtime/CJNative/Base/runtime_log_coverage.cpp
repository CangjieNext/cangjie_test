/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include "runtime_base_test.h"

#include <cassert>
#include <cstdlib>
#include <cstring>
#include <sys/stat.h>
#include <unistd.h>

using MapleRuntime::CString;
using MapleRuntime::CJTHREAD;
using MapleRuntime::InitLogLevel;
using MapleRuntime::LogFile;
using MapleRuntime::Logger;
using MapleRuntime::Pretty;
using MapleRuntime::PrettyOrderInfo;
using MapleRuntime::PrettyOrderMathNano;
using MapleRuntime::REPORT;
using MapleRuntime::WriteLog;

static int callbackCount = 0;

static void LogCallback(const char *message) {
  assert(std::strcmp(message, "callback-message") == 0);
  ++callbackCount;
}

static void CheckTerminalMode() {
  Logger &logger = Logger::GetLogger();
  assert(logger.GetMinimumLogLevel() == RTLOG_ERROR);
  assert(!logger.CheckLogLevel(RTLOG_WARNING));
  assert(logger.CheckLogLevel(RTLOG_ERROR));
  logger.SetMinimumLogLevel(RTLOG_DEBUG);
  logger.SetMinimumLogLevel(RTLOG_FATAL);
  assert(logger.GetMinimumLogLevel() == RTLOG_DEBUG);
  assert(logger.CheckLogLevel(RTLOG_DEBUG));

  Logger::RegisterLogHandle(nullptr);
  Logger::InvokeLogHandle("fallback-message");
  Logger::RegisterLogHandle(LogCallback);
  Logger::InvokeLogHandle("callback-message");
  assert(callbackCount == 1);

  unsetenv("MRT_LOG_FILE_SIZE");
  assert(Logger::GetLogFileSize() == 10UL * 1024UL * 1024UL);
  setenv("MRT_LOG_FILE_SIZE", "2mb", 1);
  assert(Logger::GetLogFileSize() == 2048UL * 1024UL);
  setenv("MRT_LOG_FILE_SIZE", "17", 1);
  assert(Logger::GetLogFileSize() == 10UL * 1024UL * 1024UL);

  CString path("unchanged");
  unsetenv("RUNTIME_LLT_LOG_PATH");
  Logger::GetLogPath("RUNTIME_LLT_LOG_PATH", path);
  assert(std::strcmp(path.Str(), "unchanged") == 0);

  setenv("RUNTIME_LLT_LOG_PATH", "x", 1);
  path = CString();
  Logger::GetLogPath("RUNTIME_LLT_LOG_PATH", path);
  assert(path.IsEmpty());
  setenv("RUNTIME_LLT_LOG_PATH", "noslash", 1);
  Logger::GetLogPath("RUNTIME_LLT_LOG_PATH", path);
  assert(path.IsEmpty());
  setenv("RUNTIME_LLT_LOG_PATH", "./runtime-path.log", 1);
  Logger::GetLogPath("RUNTIME_LLT_LOG_PATH", path);
  assert(path.Find("runtime-path.log") >= 0);
  setenv("RUNTIME_LLT_LOG_PATH", "./", 1);
  Logger::GetLogPath("RUNTIME_LLT_LOG_PATH", path);
  assert(!path.IsEmpty());
  assert(!MapleRuntime::IsHaveCommandInjection(CString("./safe.log")));
  assert(MapleRuntime::IsHaveCommandInjection(CString("./bad;name.log")));
  setenv("RUNTIME_LLT_LOG_PATH", "./bad;name.log", 1);
  Logger::GetLogPath("RUNTIME_LLT_LOG_PATH", path);

  FILE *temporary = tmpfile();
  assert(temporary != nullptr);
  assert(!Logger::MaybeRotate(0, 1, temporary));
  std::fputs("abc", temporary);
  assert(Logger::MaybeRotate(3, 3, temporary));
  assert(std::ftell(temporary) == 0);
  std::fclose(temporary);

  logger.FormatLog(RTLOG_DEBUG, true, "debug %d", 1);
  logger.FormatLog(RTLOG_ERROR, false, "signal-safe error");
  CString huge(1500, 'z');
  logger.FormatLog(RTLOG_ERROR, true, "%s", huge.Str());
}

static void CheckFileMode() {
  Logger &logger = Logger::GetLogger();
  logger.SetMinimumLogLevel(RTLOG_VERBOSE);
  assert(logger.CheckLogLevel(RTLOG_INFO));
  for (int i = 0; i < 40; ++i) {
    logger.FormatLog(RTLOG_INFO, true,
                     "rotation-line-%d-abcdefghijklmnopqrstuvwxyz-"
                     "abcdefghijklmnopqrstuvwxyz",
                     i);
  }
  logger.FormatLog(RTLOG_REPORT, true, "report-line");
  logger.FormatLog(RTLOG_ERROR, true, "flush-line");

  struct stat info = {};
  assert(stat("runtime_log_output.txt", &info) == 0);
  assert(info.st_size > 0);
  assert(info.st_size <= 2048);
  unlink("runtime_log_output.txt");
}

static void CheckInvalidFileMode() {
  Logger &logger = Logger::GetLogger();
  assert(!logger.CheckLogLevel(RTLOG_ERROR));
  assert(logger.CheckLogLevel(RTLOG_ERROR));
}

static void CheckLogLevelsAndPrettyFormatting() {
  unsetenv("MRT_LOG_LEVEL");
  assert(InitLogLevel() == RTLOG_ERROR);

  struct LogLevelCase {
    const char *text;
    RTLogLevel expected;
  };
  const LogLevelCase cases[] = {{"v", RTLOG_VERBOSE}, {"d", RTLOG_DEBUG},
                                {"i", RTLOG_INFO},    {"w", RTLOG_WARNING},
                                {"e", RTLOG_ERROR},   {"f", RTLOG_FATAL},
                                {"s", RTLOG_FAIL}};
  for (const auto &test : cases) {
    setenv("MRT_LOG_LEVEL", test.text, 1);
    assert(InitLogLevel() == test.expected);
  }
  setenv("MRT_LOG_LEVEL", "  i  ", 1);
  assert(InitLogLevel() == RTLOG_INFO);
  setenv("MRT_LOG_LEVEL", "invalid", 1);
  assert(InitLogLevel() == RTLOG_ERROR);
  setenv("MRT_LOG_LEVEL", "x", 1);
  assert(InitLogLevel() == RTLOG_ERROR);

  assert(std::strcmp(Pretty(0).Str(), "0") == 0);
  assert(std::strcmp(Pretty(1234567).Str(), "1,234,567") == 0);
  assert(std::strcmp(PrettyOrderInfo(1024, "B").Str(), "1024B") == 0);
  assert(std::strcmp(PrettyOrderInfo(1025, "B").Str(), "1KiB") == 0);
  assert(std::strcmp(PrettyOrderInfo(1024ULL * 1024ULL + 1025, "B").Str(),
                     "1MiB") == 0);
  assert(std::strcmp(PrettyOrderMathNano(1000, "s").Str(), "1000ns") == 0);
  assert(std::strcmp(PrettyOrderMathNano(1001, "s").Str(), "1us") == 0);
  assert(std::strcmp(PrettyOrderMathNano(1001001, "s").Str(), "1ms") == 0);
  assert(std::strcmp(PrettyOrderMathNano(1001001001, "s").Str(), "1s") == 0);
}

static void CheckLogFileMode() {
  unlink("runtime_report_output.txt");
  unlink("runtime_cjthread_output.txt");
  CheckLogLevelsAndPrettyFormatting();

  LogFile::Init();
  assert(LogFile::LogIsEnabled(REPORT));
  assert(LogFile::LogIsEnabled(CJTHREAD));
  assert(LogFile::GetFile(REPORT) != nullptr);
  assert(LogFile::GetFile(CJTHREAD) != nullptr);
  assert(LogFile::GetMaxFileSize(REPORT) == 1024);

  WriteLog(false, REPORT, "report-without-prefix-%d", 1);
  WriteLog(true, REPORT, "report-with-prefix-%d", 2);
  MRT_DumpLog("cjthread-dump-message");
  for (int i = 0; i < 40; ++i) {
    WriteLog(false, REPORT,
             "rotation-%d-abcdefghijklmnopqrstuvwxyz-abcdefghijklmnopqrstuvwxyz",
             i);
  }
  CString huge(3000, 'z');
  WriteLog(false, REPORT, "%s", huge.Str());

  assert(LogFile::GetCurPosLocation(REPORT) < 2048);
  LogFile::Fini();

  struct stat reportInfo = {};
  struct stat threadInfo = {};
  assert(stat("runtime_report_output.txt", &reportInfo) == 0);
  assert(stat("runtime_cjthread_output.txt", &threadInfo) == 0);
  assert(reportInfo.st_size > 0 && threadInfo.st_size > 0);
  unlink("runtime_report_output.txt");
  unlink("runtime_cjthread_output.txt");
}

static void CheckInvalidLogFileMode() {
  LogFile::Init();
  assert(!LogFile::LogIsEnabled(REPORT));
  WriteLog(false, REPORT, "disabled-message");

  LogFile::logFile[REPORT].enableLog = true;
  assert(LogFile::GetFile(REPORT) == nullptr);
  WriteLog(false, REPORT, "null-file-message");
  LogFile::logFile[REPORT].enableLog = false;
  LogFile::Fini();
  CheckLogLevelsAndPrettyFormatting();
}

int main(int argc, char **argv) {
  assert(argc == 2);
  if (std::strcmp(argv[1], "terminal") == 0) {
    CheckTerminalMode();
  } else if (std::strcmp(argv[1], "file") == 0) {
    CheckFileMode();
  } else if (std::strcmp(argv[1], "invalid") == 0) {
    CheckInvalidFileMode();
  } else if (std::strcmp(argv[1], "logfile") == 0) {
    CheckLogFileMode();
  } else if (std::strcmp(argv[1], "logfile-invalid") == 0) {
    CheckInvalidLogFileMode();
  } else {
    return 2;
  }
  std::puts("runtime log coverage pass");
  return 0;
}
