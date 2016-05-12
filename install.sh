wget http://downloads.tatoeba.org/exports/sentences.tar.bz2
wget http://downloads.tatoeba.org/exports/links.tar.bz2
echo "Extract sentences.csv..."
tar xvjf sentences.tar.bz2
echo "Ready!"
echo "Extract links.csv..."
tar xvjf links.tar.bz2
echo "Ready!"
echo "sentences.csv pocessing"
sed 's/"/""/g;s/[^\t]*/"&"/g' sentences.csv > sentences_sed.csv
echo "Ready!"
echo "Lowercase conversion..."
./lower.py sentences_sed.csv sentencesl.csv
echo "Ready!"
echo "Creating database"
sqlite3 < init.sql
echo "Ready!"
echo "Cleaning..."
rm -rf sentences.tar.bz2 links.tar.bz2 sentences.csv links.csv sentencesl.csv sentences_sed.csv
echo "Ready!"
echo "Installation completed successfully"
echo "Enter ./tcv-no-color3 <level> <count> <lc1> <lc2> for showing [count] results from [lc1] to [lc2] with depth [level]"
echo "For example:"
echo "./tcv-no-color3 5 100 rus eng"
echo "./tcv-no-color3 5 100 eng deu"