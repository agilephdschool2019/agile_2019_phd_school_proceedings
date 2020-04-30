FROM rocker/verse:3.6.2

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libgit2-dev \
  && rm -rf /tmp/* \
  && apt-get autoremove -y \
  && apt-get autoclean -y \
  && rm -rf /var/lib/apt/lists/*

RUN install2.r --error here gert rticles kableExtra

RUN r -e 'tinytex::tlmgr_install(pkgs = c("ms", \ 
    "scalerel", \
    "xcolor", \
    "pgf"))'

CMD ["r", "-e", "setwd(\"/workspace\"); rmarkdown::render(\"agile_2019_phd_school_proceedings.Rmd\")"]

LABEL maintainer="daniel.nuest@uni-muenster.de" \
  org.opencontainers.image.created='2020' \
  org.opencontainers.image.authors='Daniel Nüst' \
  org.opencontainers.image.url='https://github.com/agilephdschool2019/agile_2019_phd_school_proceedings/'

## Build the image
# docker build --tag agilephd2019 .
## Run the image: we mount the data into the image, matching the user so there are no issues with file permissions
# docker run --rm -it --user $UID -v $(pwd):/workspace agilephd2019
# see submissions/ for the ZIP archive with all papers