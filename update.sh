git clone git://github.com/rasmuserik/mLibraries.wiki.git &&
cd mLibraries.wiki &&
for md in *.md
do
   name=`echo $md | sed -e s/.md$//`
   echo --- > "../$md"
   echo title: $name >> "../$md"
   echo layout: default >> "../$md"
   echo --- >> "../$md"
   cat "$md" | sed -e 's/\[\[\([^]]*\)\]\]/[\1](http:\/\/mLibraries.org\/\1)/g' >> "../$md"
   cat "$md" | sed -e 's/\[\[\([^]]*\)\]\]/[\1](http:\/\/mLibraries.org\/\1)/g' | markdown2pdf -o ../$name.pdf
   cd ..
   git add $md
   git add $name.pdf
   cd mLibraries.wiki
done &&
cd .. &&
rm -rf mLibraries.wiki &&
git commit -m "import of pages from wiki" &&
git push
