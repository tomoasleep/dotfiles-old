#!/bin/sh
apmlist=$(apm list)
apmline=$(echo "$apmlist" | grep /Users/tomoya/.atom/packages -n | cut -d ':' -f1)

echo "#!/bin/sh"
echo "$apmlist" | sed -e 1,${apmline}d | grep -o -e '─ .*@' | sed -e 's/─ \(.*\)@/apm install \1/'
