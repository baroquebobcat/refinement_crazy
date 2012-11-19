Refinement Crazy
================

Playing with refinements.


Run em all
------

  function rrun { echo ; echo $1 ; echo "====" ; grep '#' $1; echo ; echo "----" ; ruby $1; echo '----' ; }
  for x in `ls *.rb`; do rrun $x; done
