#pragma once

#include <chrono>
namespace utils {
using namespace std::chrono_literals;
using namespace std::chrono;

// seconds
inline time_t now_s()
{
    return duration_cast<seconds>( system_clock::now().time_since_epoch() ).count();
}

// milliseconds
inline time_t now_us()
{
    return duration_cast<milliseconds>( system_clock::now().time_since_epoch() ).count();
}
// microseconds
inline time_t now_ms()
{
    return duration_cast<microseconds>( system_clock::now().time_since_epoch() ).count();
}
// nanoseconds
inline time_t now_nan()
{
    return duration_cast<nanoseconds>( system_clock::now().time_since_epoch() ).count();
}
} // namespace utils

