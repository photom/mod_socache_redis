mod_socache_redis
=============
Apache SSL Session cache module for Redis. 
This module is based on mod_socache_memcache and can be used for SSL Session
cache (mod_socache_memcache's some functions are not ported).

This fork is my attempt to get this working on Apache 2.4 built with any of the
various Visual Studio versions we use (not just the latest) to build at Apache 
Haus. So this basically means no C99 and we cannot declare arrays with a 
variable for it's size like: type array_name[var]; Why I don't know.
