## pre-commit node environment issues when running as root
when using `node` as the language for a pre-commit hook, it seems like it is expected to be running as user `1000`. This proves to be a problem when additional dependencies are installed and their post-install hooks are ran, for example this script: https://github.com/zloirock/core-js/blob/master/packages/core-js-pure/package.json#L55 will fail with:
```
    sh: 1: node: Permission denied
    npm ERR! code ELIFECYCLE
    npm ERR! syscall spawn
    npm ERR! file sh
    npm ERR! errno ENOENT
    npm ERR! core-js-pure@3.6.2 postinstall: `node -e "try{require('./postinstall')}catch(e){}"`
    npm ERR! spawn ENOENT
    npm ERR!
    npm ERR! Failed at the core-js-pure@3.6.2 postinstall script.
    npm ERR! This is probably not a problem with npm. There is likely additional logging output above.
```

according to this [stackoverflow thread](https://stackoverflow.com/a/53270214), it has to do with the [npm configuration option for user](https://docs.npmjs.com/misc/config#user). And indeed, running this as user 1000 works whereas running as root fails.

### Prerequistes
- docker

### Steps to reproduce
- clone repo
- ./run.sh
