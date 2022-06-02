#!/bin/bash

ulimit -n 10240

# echo "shapefiles"
# ogr2ogr -explodecollections -where "OGR_GEOMETRY='MultiGeometry'" -f "ESRI Shapefile" UTIG_Trackline_MultiGeometry_shapefile UTIG_Trackline.kml
#
# # echo "\n"
# # echo "linestrings"
# # ogr2ogr -explodecollections -overwrite -where "OGR_GEOMETRY='LineString'" -f "ESRI Shapefile" UTIG_Trackline_linestrings_shapefile UTIG_Trackline.kml
# #
# #
# echo "csv"
# ogr2ogr -overwrite -explodecollections -where "OGR_GEOMETRY='MultiGeometry'" -f "CSV" UTIG_Trackline_MultiGeometry_csv UTIG_Trackline.kml
#
# echo "\n"
# echo "linestrings"
# ogr2ogr -explodecollections -where "OGR_GEOMETRY='LineString'" -f "CSV" UTIG_Trackline_linestrings_csv UTIG_Trackline.kml


ogr2ogr -overwrite -f "CSV" -lco GEOMETRY=AS_XY UTIG_Trackline.csv UTIG_Trackline.kml

ulimit -n 256


