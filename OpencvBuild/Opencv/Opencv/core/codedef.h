#ifndef CODEDEF_H
#define CODEDEF_H

#ifndef UNICODE
#define UNICODE
#define UNICODE_WAS_UNDEFINED
#endif

#ifdef Q_OS_WIN
#include <Windows.h>

#endif

#ifdef UNICODE_WAS_UNDEFINED
#undef UNICODE
#endif

#define WINRT

#endif // CODEDEF_H
