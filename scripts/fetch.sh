year=`date +"%Y"`
for counter in `seq 2017 $year`
do
  echo "Fetching $counter"
  curl -f -o source/$counter.html https://www.praha7.cz/temata/otevrena-radnice/faktury-proplacene-radnici/prehled-proplacenych-faktur-$counter/
done
