if [ ! -d "/var/lib/mysql/mysql" ]; then
    chown -R mysql:mysql /var/lib/mysql
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql --rpm
    tfile=`mktemp`
    [ ! -f "$tfile" ] && { return 1; }
fi
