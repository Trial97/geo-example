FROM jupyter/all-spark-notebook


RUN pip install --upgrade pip
RUN pip install rasterio
RUN pip install geopandas

# Install GeoPySpark
RUN pip install pyspark>=2.1.1
RUN pip install geopyspark
RUN pip install folium
RUN geopyspark install-jar

#run this in doxker
# RUN sysctl -w vm.swappiness=10
# RUN cat /proc/sys/vm/swappiness
