FROM nvidia/cuda

ENV PATH /root/anaconda3/bin:$PATH

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh -O ~/anaconda.sh
RUN bash ~/anaconda.sh -b && \
    /root/anaconda3/bin/conda init bash

RUN conda update -n base conda && \
    conda create -y -n tf-gpu python=3.6 anaconda && \
    . activate tf-gpu && \
    conda install -y -n tf-gpu tensorflow-gpu=1.13.1 keras-gpu

CMD [ "/bin/bash" ]
