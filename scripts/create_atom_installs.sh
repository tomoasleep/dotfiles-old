#!/bin/sh
apmlist=$(apm list)
apmline=$(echo "$apmlist" | grep $HOME/.atom/packages -n | cut -d ':' -f1)
packages=$(echo "$apmlist" | sed -e 1,${apmline}d | grep -o -e '─ .*@' | sed -e 's/─ \(.*\)@/\1/')

cat <<EOS
#!/bin/sh
EOS

for package in $packages
do
  echo "apm install ${package}"
done
