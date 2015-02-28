mod_socache_redis.la: mod_socache_redis.slo
	$(SH_LINK) -rpath $(libexecdir) -module -avoid-version  mod_socache_redis.lo
DISTCLEAN_TARGETS = modules.mk
shared =  mod_socache_redis.la
