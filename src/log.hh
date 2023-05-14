#ifndef LOG_HH
#define LOG_HH

#include <string>

namespace events
{
  void start_log();
  void log(const std::string& str);
  std::string get_time_now(const std::string& time_format = "%X");
};

#endif
