# Build:
#   docker build -t dgageot/managed .
#
# Run:
#   docker run --rm -ti dgageot/managed

FROM dgageot/docker-fluent

# Set run environment
#
ENV PROD_MODE true
ENV MEMORY 4
EXPOSE 8080
CMD java -DPROD_MODE=${PROD_MODE} -Xmx${MEMORY}G -jar target/web.jar

# Add all sources from docker context
#
ADD java /app

# Build the app
# (This command being last, a change in the code triggers a
# minimal rebuild)
#
RUN mvn verify dependency:copy-dependencies -DskipTests