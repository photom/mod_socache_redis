##
##  Makefile -- Build procedure for sample socache_redis Apache module
##  Autogenerated via ``apxs -n socache_redis -g''.
##

builddir=.
top_srcdir=/root/work/build
top_builddir=/root/work/build
include /root/work/build/build/special.mk

#   the used tools
APACHECTL=apachectl

#   additional defines, includes and libraries
#DEFS=-Dmy_define=my_value
#INCLUDES=-Imy/include/dir
#LIBS=-Lmy/lib/dir -lmylib

#   the default target
all: local-shared-build

#   install the shared object file into Apache 
install: install-modules-yes

#   cleanup
clean:
	-rm -f mod_socache_redis.o mod_socache_redis.lo mod_socache_redis.slo mod_socache_redis.la 

#   simple test
test: reload
	lynx -mime_header http://localhost/socache_redis

#   install and activate shared object by reloading Apache to
#   force a reload of the shared object file
reload: install restart

#   the general Apache start/restart/stop
#   procedures
start:
	$(APACHECTL) start
restart:
	$(APACHECTL) restart
stop:
	$(APACHECTL) stop

