FROM alpine

LABEL MAINTAINER="CHANDRA" \
    email="chandra@gmail.com" \
    version="1.0"

RUN touch UAS-2025.txt && \
    echo "UAS PCC 2025 chandra" > pccm-2025.txt

CMD ["sh","-c","cat pccm-2025.txt"]