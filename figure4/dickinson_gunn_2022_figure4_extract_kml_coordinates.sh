#!/bin/bash


scripts=$(pwd)

# Seismic data downloaded from http://www.continentalshelf.org/kmz.aspx
# Convert downloaded KMZ files to CSV
echo "converting continentalshelf.org kmz files"
directory=./data/onestop_shop/final_format
cd $directory
for infile in ./*kmz
do
	stem=${infile%*.kmz}
	cp $infile $stem.zip
	unzip $stem.zip
	gsed 's/<name>/\n\n/g' $stem.kml | gsed 's/<\/LineString><LineString>/<\/LineString>\n\n<LineString>/g' | awk -F '<LineString>|</LineString>' '{print $2}' | awk -F '<coordinates>|</coordinates>' '{print $2}' | tr " " "\n" > temp.csv
	cat -s temp.csv | awk '!NF{$0=">"}1' > $stem"_LineStrings".csv
	rm temp.csv
	rm *zip *png *kml
done
cd $scripts


# 2D seismic data downloaded from National Archive of Marine Seismic Surveys (NAMSS) of the United States Geological Survey (walrus.wr.usgs.gov/namss)
# Downloaded Shapefiles were converted to KML using QGIS
# Convert KML files to CSV
echo "converting NAMSS 2D files"
directory=./data/namss/namss_shapefile_unzipped
namss_2d_file=namss_2d_qgis_shp2kml_conversion
cd $directory
stem=./$namss_2d_file
gsed 's/<name>/\n\n/g' $stem.kml | gsed 's/<\/LineString><LineString>/<\/LineString>\n\n<LineString>/g' | awk -F '<LineString>|</LineString>' '{print $2}' | awk -F '<coordinates>|</coordinates>' '{print $2}' | tr " " "\n" > temp.csv
cat -s temp.csv | awk '!NF{$0=">"}1' > $stem"_LineStrings".csv
rm temp.csv
cd $scripts


# 3D seismic data downloaded from National Archive of Marine Seismic Surveys (NAMSS) of the United States Geological Survey (walrus.wr.usgs.gov/namss)
# Downloaded Shapefiles were converted to KML using QGIS
# Convert KML files to CSV
echo "converting NAMSS 3D files"
directory=./data/namss/namss_shapefile_unzipped
namss_3d_file=namss_3d_qgis_shp2kml_conversion
cd $directory
stem=./$namss_3d_file
gsed 's/<name>/\n\n/g' $stem.kml | gsed 's/<\/LinearRing><LinearRing>/<\/LinearRing>\n\n<LinearRing>/g' | awk -F '<LinearRing>|</LinearRing>' '{print $2}' | awk -F '<coordinates>|</coordinates>' '{print $2}' | tr " " "\n" > temp.csv
cat -s temp.csv | awk '!NF{$0=">"}1' > $stem"_LinearRings".csv
rm temp.csv
cd $scripts


# Seismic data downloaded from Geoscience Australia (data.gov.au/data/dataset/marine-seismic-surveys-shape-files-and-kml-files)
# Convert downloaded KMZ files to CSV
echo "converting Geoscience Australia KMZ files"
directory=./data/geoscience_australia/old
geoscience_australia_file=geoscience_australia_seismic
cd $directory
stem=./$geoscience_australia_file
cp $stem.kmz $stem.zip
unzip $stem.zip
cp doc.kml $stem.kml
gsed 's/\t//g' $stem.kml | tr -d '\n' | gsed 's/<\/LineString><LineString>/<\/LineString>\n\n<LineString>/g' | awk -F '<LineString>|</LineString>' '{print $2}' | awk -F '<coordinates>|</coordinates>' '{print $2}' | tr " " "\n" > temp.csv
cat -s temp.csv | awk '!NF{$0=">"}1' > $stem"_LineStrings".csv
rm temp.csv doc.kml $stem.zip
cd $scripts


# Seismic data downloaded from Geoscience Australia (data.gov.au/data/dataset/marine-seismic-surveys-shape-files-and-kml-files)
# Downloaded Shapefiles were converted to KML using QGIS
# Convert KML files to CSV
echo "converting Geoscience Australia KML files"
directory=./data/geoscience_australia/74674_shp/GAMS_split/shp2kml
geoscience_australia_file=Surveys_XFiles_2012_Nov
cd $directory
for infile in ./*kml
do
	stem=${infile%*.kml}
	gsed 's/\t//g' $stem.kml | tr -d '\n' | gsed 's/<name>/\n\n/g'| gsed 's/<LineString>/\n\n<LineString>/g' | awk -F '<LineString>|</LineString>' '{print $2}' | awk -F '<coordinates>|</coordinates>' '{print $2}' | tr " " "\n" > temp.csv
	cat -s temp.csv | awk '!NF{$0=">"}1' > $stem"_LineStrings".csv
	rm temp.csv
done
cd $scripts


# Seismic data downloaded from British Geological Survey (BGS;  http://mapapps2.bgs.ac.uk/geoindex_offshore/home.html)
# Downloaded Shapefiles were converted to KML using QGIS
# Convert KML files to CSV
echo "converting BGS KML files"
directory=./data/bgs/shp2kml
cd $directory
for infile in ./*kml
do
	stem=${infile%*.kml}
	gsed 's/\t//g' $stem.kml | tr -d '\n' | gsed 's/<name>/\n\n/g'| gsed 's/<LineString>/\n\n<LineString>/g' | awk -F '<LineString>|</LineString>' '{print $2}' | awk -F '<coordinates>|</coordinates>' '{print $2}' | tr " " "\n" > temp.csv
	cat -s temp.csv | awk '!NF{$0=">"}1' > $stem"_LineStrings".csv
	rm temp.csv
done







