set -xe
./kiva kivac.k kivac
cp kivac /usr/bin && chmod 755 /usr/bin/kivac
cp kivaa /usr/bin && chmod 755 /usr/bin/kivaa
echo -e "#!/usr/bin/bash\n\nset -e\nkivac \$1 \$2.ir\nkivaa \$2.ir \$2 \${@:3}\n" > /usr/bin/kiva && chmod 755 /usr/bin/kiva
