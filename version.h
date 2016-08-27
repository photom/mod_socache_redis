/*
 * Copyright 2016 Gregg Smith
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef VERSION_H
#define VERSION_H

#define MOD_SOCACHE_REDIS_VERSION_MAJOR               0
#define MOD_SOCACHE_REDIS_VERSION_MINOR               0
#define MOD_SOCACHE_REDIS_VERSION_REVISION            17

/* With all the different binary packages from third parties available 
 * using many different versions of Visual C++, it would be nice to
 * allow the user to know just which compiler this module was built on. 
 */

#if VCVER
#   if VCVER == 6 /* (Visual C++ 6) */
#   define MSVC_COMPILER "Visual C++ 6"
#   elif VCVER == 7 /* (Visual C++ .Net) */
#   define MSVC_COMPILER "Visual C++ .Net"
#   elif VCVER == 71 /* (Visual C++ 2003) */
#   define MSVC_COMPILER "Visual C++ .Net 2003"
#   elif VCVER == 8 /* (Visual C++ 2005) */
#   define MSVC_COMPILER "Visual C++ 2005"
#   elif VCVER == 9 /* (Visual C++ 2008) */
#   define MSVC_COMPILER "Visual C++ 2008"
#   elif VCVER == 10 /* (Visual C++ 2010) */
#   define MSVC_COMPILER "Visual C++ 2010"
#   elif VCVER == 11 /* (Visual C++ 2012) */
#   define MSVC_COMPILER "Visual C++ 2012"
#   elif VCVER == 12 /* (Visual C++ 2013) */
#   define MSVC_COMPILER "Visual C++ 2013"
#   elif VCVER == 14 /* (Visual C++ 2015) */
#   define MSVC_COMPILER "Visual C++ 2015"
#   elif VCVER == 15 /* (Visual C++ 2016) */
#   define MSVC_COMPILER "Visual C++ 2016"
#   endif
#endif

#endif /* VERSION_H */
