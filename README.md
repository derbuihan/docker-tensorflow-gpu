# docker-tensorflow-gpu
Anacondaを用いたtensorflow-gpuのDockerfile

# 動作環境

- docker 19.03 以降
- nvidia-driver [この辺](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html)を見ながら適当に
- Ubuntu 18.04

# 遊び方

```
$ git clone https://github.com/derbuihan/docker-tensorflow-gpu
$ cd docker-tensorflow-gpu
$ docker build -t mnist_sample .
$ docker run --gpus device=0 -it --rm mnist_sample /bin/bash
(base)$ conda activate tf-gpu
(tf-gpu)$ wget https://raw.githubusercontent.com/keras-team/keras/master/examples/mnist_cnn.py
(tf-gpu)$ python mnist_cnn.py
```

# 解説

[tensorflow/tensorflow:latest-gpu-py3](https://hub.docker.com/r/tensorflow/tensorflow)をSandy Bridge以前のCPUで使うと

```
Illegal instruction (core dumped)
```

というエラーが出ます。これはAVXがないとか言うのが原因です。([参考](https://github.com/tensorflow/tensorflow/issues/19584))

AnacondaではAVXがなくても使えるバイナリを配布してるので、これを用いるとAVXがないCPUでもtensorflow-gpuを動かすことができます。

このリポジトリでは[nvidia/cuda](https://hub.docker.com/r/nvidia/cuda/)をベースにAnacondaを用いて環境構築を行い、Sandy Bridge以前のCPUでもDockerを用いたtensorflow-gpuの環境を提供します。

